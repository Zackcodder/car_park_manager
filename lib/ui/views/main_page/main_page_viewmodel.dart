import 'dart:math';

import 'package:car_park_manager/app/app.locator.dart';
import 'package:car_park_manager/app/app.router.dart';
import 'package:car_park_manager/models/place.dart';
import 'package:car_park_manager/services/geo_location_service.dart';
import 'package:car_park_manager/services/google_map_service.dart';
import 'package:car_park_manager/services/places_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:car_park_manager/services/places_service.dart';
import 'package:stacked_services/stacked_services.dart';

class MainPageViewModel extends BaseViewModel {
  // final getIt = GetIt.instance;
  // // google map service
  // final googleMapService = locator<GoogleMapService>();

  // final _snackbarService = locator<SnackbarService>();

  final placeService = locator<PlacesService>();

  final _navigationService = locator<NavigationService>();

  // get googlePlex => googleMapService.googlePlex;

  // dynamic _currentPosition;

  // /// returns current position
  // get currentPosition async =>
  //     _currentPosition ??= await geoLocationService.getCurrentPosition();

  // init() async {
  //   _currentPosition = await geoLocationService.getCurrentPosition();
  //   notifyListeners();
  // }

  // convertPositionToLatLng(position) =>
  //     googleMapService.convertPositionToLatLng(position);

  // Stream get getPositionStream => geoLocationService.getPositionStream();

  // locationUpdates(position) async =>
  //     googleMapService.locationUpdates(position: position);

  // get cameraUpdate {
  //   return googleMapService.cameraUpdate;
  // }

  // get circles => googleMapService.mainPageCircles(_currentPosition);
  // get markers => googleMapService.markers;
  final PlacesService _placeService = locator<PlacesService>();
  PlaceModel driver = PlaceModel();

  List<PlaceModel> placeList = [];
  List<PlaceModel> get placeLists => placeList;

  Future<void> fetchPlaces() async {
    placeList = await _placeService.getPlaces(10.4418805593, 7.49562339819);
    notifyListeners();
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

  signOut() {
    _navigationService.navigateTo(Routes.loginView);
  }
}
