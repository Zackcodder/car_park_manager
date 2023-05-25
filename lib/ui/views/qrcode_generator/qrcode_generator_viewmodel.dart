import 'package:car_park_manager/app/app.locator.dart';
import 'package:car_park_manager/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:car_park_manager/ui/views/qrcode_generator/qrcode_generator_view.form.dart';
import 'package:stacked_services/stacked_services.dart';

class QrcodeGeneratorViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();

  String? data;
  // State the new state of the qrcode
  //from the values entered in the text field
  changeValue(value) {
    data = value;
  }

  generateCode() {
    data = subjectValue;
  }

  // navigates to feedback
  nToFeedBack() {
    _navigationService.navigateTo(Routes.feedbackView);
  }

  //navigates to Home
  nToHome() {
    _navigationService.navigateTo(Routes.mainPageView);
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
