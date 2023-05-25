import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:car_park_manager/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:car_park_manager/services/google_map_service.dart';
import 'package:car_park_manager/services/geo_location_service.dart';
import 'package:car_park_manager/services/map_toolkit_service.dart';
import 'package:car_park_manager/services/places_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<GoogleMapService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<GeoLocationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<MapToolkitService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<PlacesService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterGoogleMapService();
  getAndRegisterGeoLocationService();
  getAndRegisterMapToolkitService();
  getAndRegisterPlacesService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockGoogleMapService getAndRegisterGoogleMapService() {
  _removeRegistrationIfExists<GoogleMapService>();
  final service = MockGoogleMapService();
  locator.registerSingleton<GoogleMapService>(service);
  return service;
}

MockGeoLocationService getAndRegisterGeoLocationService() {
  _removeRegistrationIfExists<GeoLocationService>();
  final service = MockGeoLocationService();
  locator.registerSingleton<GeoLocationService>(service);
  return service;
}

MockMapToolkitService getAndRegisterMapToolkitService() {
  _removeRegistrationIfExists<MapToolkitService>();
  final service = MockMapToolkitService();
  locator.registerSingleton<MapToolkitService>(service);
  return service;
}

MockPlacesService getAndRegisterPlacesService() {
  _removeRegistrationIfExists<PlacesService>();
  final service = MockPlacesService();
  locator.registerSingleton<PlacesService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
