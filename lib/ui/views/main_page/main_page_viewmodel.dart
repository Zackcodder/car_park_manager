import 'dart:math';

import 'package:car_park_manager/app/app.locator.dart';
import 'package:car_park_manager/app/app.router.dart';
import 'package:car_park_manager/models/place.dart';
import 'package:car_park_manager/services/geo_location_service.dart';
import 'package:car_park_manager/services/google_map_service.dart';
import 'package:car_park_manager/services/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:car_park_manager/services/places_service.dart';
import 'package:stacked_services/stacked_services.dart';

class MainPageViewModel extends BaseViewModel {
  // google map service
  final _googleMapService = locator<GoogleMapService>();
  final _geoLocationService = locator<GeoLocationService>();

  // final _snackbarService = locator<SnackbarService>();

  final placeService = locator<PlacesService>();

  final _navigationService = locator<NavigationService>();

  get googlePlex => _googleMapService.googlePlex;

  dynamic _currentPosition;

  // /// returns current position
  get currentPosition async =>
      _currentPosition ??= await _geoLocationService.getCurrentPosition();

  init() async {
    _currentPosition = await _geoLocationService.getCurrentPosition();
    notifyListeners();
  }

  convertPositionToLatLng(position) =>
      _googleMapService.convertPositionToLatLng(position);

  Stream get getPositionStream => _geoLocationService.getPositionStream();

  locationUpdates(position) async =>
      _googleMapService.locationUpdates(position: position);

  get cameraUpdate {
    return _googleMapService.cameraUpdate;
  }

  get circles => _googleMapService.mainPageCircles(_currentPosition);
  // get markers => googleMapService.markers;
  final PlacesService _placeService = locator<PlacesService>();
  PlaceModel driver = PlaceModel();

  List<PlaceModel> placeList = [];
  List<PlaceModel> get placeLists => placeList;

  Future<void> fetchPlaces() async {
    placeList = await _placeService.getPlaces(10.4418805593, 7.49562339819);
    notifyListeners();
  }

  triggerNotifications() async {
    await AwesomeNotifications().getLocalTimeZoneIdentifier();
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: 'New Flick Notification',
        body: 'New Update Available',
        wakeUpScreen: true,
        category: NotificationCategory.Alarm,
        notificationLayout: NotificationLayout.BigPicture,
      ),
    );
  }

  // navigates to feedback
  nToFeedBack() {
    _navigationService.navigateTo(Routes.feedbackView);
  }

  //navigates to login
  nToHome() {
    _navigationService.navigateTo(Routes.homeView);
  }

  //navigates to Qr code generator
  nToQrCodeGen() {
    _navigationService.navigateTo(Routes.qrcodeGeneratorView);
  }

  //navigates to Qrcode scanner
  nToQrCodeScan() {
    _navigationService.navigateTo(Routes.qrscannerView);
  }

  //navigates to Profile Page
  nToProfilePage() {
    _navigationService.navigateTo(Routes.profileView);
  }

  signOut() {
    _navigationService.navigateTo(Routes.loginView);
  }
}
