import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Future<void> onViewModelReady(LoginViewModel viewModel) async {
    await viewModel.init();
    await viewModel.checkBiometrics();
    await viewModel.authenticate();
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 130),
            //Login Header
            const Center(
              child: Text('LOGIN',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            // Fingerprint logo
            Container(
              margin: const EdgeInsets.only(bottom: 130, left: 30, right: 120),
              child: const IconButton(
                onPressed: null,
                //'_authenticate',
                icon: Icon(Icons.fingerprint_sharp,
                    size: 150, color: Colors.blue),
              ),
            ),
            const Text('Fingerprint Auth', style: TextStyle(fontSize: 20.0)),
            const Text('Authenticate using your fingerprint',
                style: TextStyle(fontSize: 16.0)),
            // Fingerprint Authenticate Button
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
              child: Material(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color.fromARGB(255, 20, 118, 197).withOpacity(1.0),
                elevation: 10.0,
                child: MaterialButton(
                  //calls the function to authenticate the fingerprint
                  onPressed: viewModel.authenticate,
                  minWidth: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Authenticate",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
