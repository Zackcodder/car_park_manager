import 'dart:math';

import 'package:car_park_manager/app/app.locator.dart';
import 'package:car_park_manager/app/app.router.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum _SupportState {
  unknown,
  supported,
  unsupported,
}

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  late final LocalAuthentication auth = LocalAuthentication();

  init() async {
    checkBiometrics();
    notifyListeners();
  }

  _SupportState supportState = _SupportState.unknown;
  bool? canCheckBiometrics;
  List<BiometricType>? availableBiometrics;
  String authorized = 'Not Authorized';
  bool isAuthenticating = false;

  deviceSupport() {
    auth.isDeviceSupported().then((bool isSupported) => supportState =
        isSupported ? _SupportState.supported : _SupportState.unsupported);
  }

  //Function that check the device for the biometric hardware availability
  Future<void> checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
    }

    canCheckBiometrics = canCheckBiometrics;
    notifyListeners();
  }

  //Function that analyze and authenticate the user fingerprint
  Future<void> authenticate() async {
    bool authenticated = false;
    try {
      isAuthenticating = true;
      authorized = 'Authenticating';
      authenticated = await auth.authenticate(
        localizedReason: 'Scan your FingerPrint',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      isAuthenticating = false;
    } on PlatformException catch (e) {
      isAuthenticating = false;
      authorized = 'Error - ${e.message}';
    }
    authorized = authenticated ? 'Authorized' : 'Not Authorized';
    notifyListeners();
    if (authenticated) {
      _navigationService.pushNamedAndRemoveUntil(Routes.startupView);
    }
  }
}
