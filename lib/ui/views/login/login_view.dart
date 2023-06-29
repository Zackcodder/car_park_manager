import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

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

  Widget _buildContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SocialLoginButton(
                buttonType: SocialLoginButtonType.apple,
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              SocialLoginButton(
                buttonType: SocialLoginButtonType.twitter,
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              SocialLoginButton(
                buttonType: SocialLoginButtonType.facebook,
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              SocialLoginButton(
                buttonType: SocialLoginButtonType.google,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 130),
              //Login Header
              const Center(
                child: Text('Login ',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
              // Fingerprint logo
              Container(
                margin: const EdgeInsets.only(bottom: 30, left: 50, right: 80),
                child: IconButton(
                  onPressed: viewModel.authenticate,
                  icon: const Icon(Icons.fingerprint_sharp,
                      size: 70, color: Colors.blue),
                ),
              ),
              const Text('Fingerprint Auth', style: TextStyle(fontSize: 20.0)),
              const Text('\n\nSignIn with Social Account',
                  style: TextStyle(fontSize: 16.0)),
              //Social Media login Buttons
              _buildContainer(context)
            ],
          ),
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
