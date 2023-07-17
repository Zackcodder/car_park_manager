import 'package:car_park_manager/app/app.locator.dart';
import 'package:car_park_manager/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FeedbackViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // navigates to feedback
  nToFeedBack() {
    _navigationService.navigateTo(Routes.feedbackView);
  }

  //navigates to MainPage
  nToMainPage() {
    _navigationService.pushNamedAndRemoveUntil(Routes.mainPageView);
  }

  //navigates to MainPage
  nToHome() {
    _navigationService.pushNamedAndRemoveUntil(Routes.mainPageView);
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
    _navigationService.pushNamedAndRemoveUntil(Routes.loginView);
  }
}
