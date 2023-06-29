import 'dart:io';

import 'package:car_park_manager/app/app.locator.dart';
import 'package:car_park_manager/ui/common/app_colors.dart';
import 'package:car_park_manager/ui/common/brand_colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_toolkit_service.dart';

class GoogleMapService {
  final _mapToolkitService = locator<MapToolkitService>();
  BitmapDescriptor? movingMarkerIcon;

  Set<Marker> _markers = <Marker>{};
  final Set<Circle> _circles = <Circle>{};

  Set<Marker> get markers => _markers;

  setMarkers(Set<Marker> markers) => _markers = markers;

  // Marker createMarker({
  //   required String id,
  //   required LatLng position,
  //   required String iconPath,
  //   required ImageConfiguration imageConfiguration,
  //   required double rotation,
  // }) {
  //   BitmapDescriptor bitMapIcon = BitmapDescriptor.defaultMarker;
  //   BitmapDescriptor.fromAssetImage(
  //           imageConfiguration,
  //           (Platform.isIOS)
  //               ? 'assets/images/car_ios.png'
  //               : 'images/car_android.png')
  //       .then((icon) {
  //     bitMapIcon = icon;
  //   });

  //   return Marker(
  //     markerId: MarkerId('driver$id'),
  //     position: position,
  //     icon: bitMapIcon,
  //     rotation: rotation,
  //   );
  // }

  final Set<Polyline> _polyLines = <Polyline>{};

  Set<Circle> mainPageCircles(Position? pos) => pos == null
      ? {}
      : {
          Circle(
            circleId: const CircleId('current'),
            strokeColor: kcMapCircleColor.withOpacity(0.5),
            strokeWidth: 1,
            radius: 150,
            center: convertPositionToLatLng(pos),
            fillColor: kcMapCircleColor.withOpacity(0.17),
          )
        };

  CameraPosition? cameraPosition;

  CameraUpdate get cameraUpdate {
    return CameraUpdate.newCameraPosition(cameraPosition!);
  }

  LatLngBounds? bounds;

  CameraUpdate get latLngBoundsUpdate =>
      CameraUpdate.newLatLngBounds(bounds!, 70);
  // List<LatLng> polylineCoordinates = [];
  // PolylinePoints polylinePoints = PolylinePoints();

  final CameraPosition googlePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 12.4746,
  );

  createMarker(imageConfiguration) {
    if (movingMarkerIcon == null) {
      BitmapDescriptor.fromAssetImage(
              imageConfiguration,
              (Platform.isIOS)
                  ? 'assets/images/car_ios.png'
                  : 'assets/images/car_android.png')
          .then((icon) {
        movingMarkerIcon = icon;
      });
    }
  }

  locationUpdateForMainPage({
    required Position position,
  }) {
    LatLng pos = LatLng(position.latitude, position.longitude);
    cameraPosition = CameraPosition(target: pos, zoom: 17);
  }

  updateCameraPosition(Position position) {
    LatLng pos = LatLng(position.latitude, position.longitude);
    CameraPosition(target: pos, zoom: 17);
  }

  locationUpdates({
    required Position position,
    List? oldLatLng,
  }) async {
    LatLng pos = LatLng(position.latitude, position.longitude);

    if (oldLatLng != null) {
      var rotation = _mapToolkitService.getMarkerRotation(
          oldLatLng[0], oldLatLng[1], position.latitude, position.longitude);

      Marker mark = Marker(
        markerId: const MarkerId('moving'),
        position: pos,
        icon: movingMarkerIcon ?? BitmapDescriptor.defaultMarker,
        rotation: rotation,
        infoWindow: const InfoWindow(title: 'Current Location'),
      );

      // remove previous markers
      _markers.removeWhere((marker) => marker.markerId.value == 'moving');
      _markers.add(mark);
    }
    cameraPosition = CameraPosition(target: pos, zoom: 17);
  }

  setPolyLine(List<LatLng> polylineCoordinates) {
    Polyline polyline = Polyline(
      polylineId: const PolylineId('polyid'),
      color: kcPink,
      points: polylineCoordinates,
      jointType: JointType.round,
      width: 4,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      geodesic: true,
    );

    _polyLines.add(polyline);
  }

  fitPolyLineToMap({required List pickup, required List destination}) {
    double pickupLongitude = pickup[1];
    double pickupLatitude = pickup[0];
    double destinationLongitude = destination[1];
    double destinationLatitude = destination[0];

    LatLng pickupLatLng = LatLng(pickupLatitude, pickupLongitude);
    LatLng destinationLatLng =
        LatLng(destinationLatitude, destinationLongitude);

    if (pickup[0] > destination[0] && pickup[1] > pickup[1]) {
      bounds = LatLngBounds(
          southwest: LatLng(destination[0], destination[1]),
          northeast: LatLng(pickup[0], pickup[1]));
    } else if (pickupLongitude > destinationLongitude) {
      bounds = LatLngBounds(
          southwest: LatLng(pickupLatitude, destinationLongitude),
          northeast: LatLng(destinationLatitude, pickupLongitude));
    } else if (pickupLatitude > destinationLatitude) {
      bounds = LatLngBounds(
        southwest: LatLng(destinationLatitude, pickupLongitude),
        northeast: LatLng(pickupLatitude, destinationLongitude),
      );
    } else {
      bounds =
          LatLngBounds(southwest: pickupLatLng, northeast: destinationLatLng);
    }

    Marker pickupMarker = Marker(
      markerId: const MarkerId('pickup'),
      position: pickupLatLng,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    );

    Marker destinationMarker = Marker(
      markerId: const MarkerId('destination'),
      position: destinationLatLng,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );

    _markers.add(pickupMarker);
    _markers.add(destinationMarker);

    Circle pickupCircle = Circle(
      circleId: const CircleId('pickup'),
      strokeColor: kcGreen,
      strokeWidth: 3,
      radius: 12,
      center: pickupLatLng,
      fillColor: BrandColors.colorGreen,
    );

    Circle destinationCircle = Circle(
      circleId: const CircleId('destination'),
      strokeColor: BrandColors.colorAccentPurple,
      strokeWidth: 3,
      radius: 12,
      center: destinationLatLng,
      fillColor: BrandColors.colorAccentPurple,
    );

    _circles.add(pickupCircle);
    _circles.add(destinationCircle);
  }

  convertPositionToLatLng(Position position) =>
      LatLng(position.latitude, position.longitude);
}
