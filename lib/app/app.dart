import 'package:car_park_manager/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:car_park_manager/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:car_park_manager/ui/views/home/home_view.dart';
import 'package:car_park_manager/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:car_park_manager/ui/views/feedback/feedback_view.dart';
import 'package:car_park_manager/ui/views/login/login_view.dart';
import 'package:car_park_manager/ui/views/qrscanner/qrscanner_view.dart';
import 'package:car_park_manager/ui/views/qrcode_generator/qrcode_generator_view.dart';
import 'package:car_park_manager/services/google_map_service.dart';
import 'package:car_park_manager/services/geo_location_service.dart';
import 'package:car_park_manager/services/map_toolkit_service.dart';
import 'package:car_park_manager/ui/views/main_page/main_page_view.dart';
import 'package:car_park_manager/services/places_service.dart';
import 'package:car_park_manager/ui/views/profile/profile_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: FeedbackView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: QrscannerView),
    MaterialRoute(page: QrcodeGeneratorView),
    MaterialRoute(page: MainPageView),
    MaterialRoute(page: ProfileView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: GoogleMapService),
    LazySingleton(classType: GeoLocationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: MapToolkitService),
    LazySingleton(classType: PlacesService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
// flutter pub run build_runner build --delete-conflicting-outputs
