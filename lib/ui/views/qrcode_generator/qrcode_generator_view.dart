import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:car_park_manager/ui/views/qrcode_generator/qrcode_generator_view.form.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../common/ui_helpers.dart';
import 'qrcode_generator_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'subject',
    // validator: ValidatorMixin.validateSubject,
  ),
])
class QrcodeGeneratorView extends StackedView<QrcodeGeneratorViewModel>
    with $QrcodeGeneratorView {
  QrcodeGeneratorView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(QrcodeGeneratorViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    QrcodeGeneratorViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Barcode Generator'),
      ),
      drawer: Container(
        width: 280,
        color: Colors.white,
        child: Drawer(
          child: Container(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                verticalSpaceLarge,
                verticalSpace(130),

                //Home Button
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 40),
                  leading: const Icon(Icons.home),
                  title: const Text(
                    'Home',
                  ),
                  onTap: viewModel.nToHome,
                ),
                verticalSpaceSmall,

                //QRcode Scanner button
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 40),
                  leading: const Icon(Icons.barcode_reader),
                  title: const Text(
                    'Scan QR and Bar Codes',
                  ),
                  onTap: viewModel.nToQrCodeScan,
                ),
                verticalSpaceSmall,

                //FeedBack button
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 40),
                  leading: const Icon(Icons.feedback_outlined),
                  title: const Text(
                    'Customer Feedback',
                  ),
                  onTap: viewModel.nToFeedBack,
                ),

                verticalSpaceSmall,

                //SignOut button
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 40),
                  leading: const Icon(Icons.logout),
                  title: const Text(
                    'SignOut',
                  ),
                  onTap: viewModel.signOut,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Text input field
          TextField(
            controller: subjectController,
            onChanged: viewModel.changeValue,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(15),
            ),
          ),
          //Display the qrcode of the value entered in the text field
          Center(
            child: QrImageView(
              data: subjectController.text,
              version: QrVersions.auto,
              size: 200,
            ),
          )
        ],
      ),
    );
  }

  @override
  QrcodeGeneratorViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      QrcodeGeneratorViewModel();
}
