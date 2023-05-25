import 'package:car_park_manager/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import 'feedback_viewmodel.dart';

class FeedbackView extends StackedView<FeedbackViewModel> {
  const FeedbackView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FeedbackViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu));
        }),
        title: const Text('Customer FeedBack'),
      ),
      //Drawer
      drawer: Container(
        width: 280,
        color: Colors.white,
        child: Drawer(
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
                  'MainPage',
                ),
                onTap: viewModel.nToMainPage,
              ),
              verticalSpaceSmall,

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

              //QRcode Generator button
              ListTile(
                contentPadding: const EdgeInsets.only(left: 40),
                leading: const Icon(Icons.qr_code_2),
                title: const Text(
                  'Generate BarCode',
                ),
                onTap: viewModel.nToQrCodeGen,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Question 1
            Container(
              margin: const EdgeInsets.fromLTRB(25, 15, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('1. Did you enjoy our Parking Service?'),
                  verticalSpaceSmall,
                  Row(
                    children: [
                      const Text('Yes'),
                      horizontalSpaceSmall,
                      RoundCheckBox(
                        onTap: (selected) {},
                        size: 24,
                        isRound: false,
                        uncheckedColor: Colors.black,
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  Row(
                    children: [
                      const Text('No'),
                      horizontalSpaceSmall,
                      RoundCheckBox(
                        onTap: (selected) {},
                        size: 24,
                        isRound: false,
                        uncheckedColor: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Question 2
            Container(
              margin: const EdgeInsets.fromLTRB(25, 15, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('2. Did you enjoy our Parking Service?'),
                  verticalSpaceSmall,
                  Row(
                    children: [
                      const Text('Yes'),
                      horizontalSpaceSmall,
                      RoundCheckBox(
                        onTap: (selected) {},
                        size: 24,
                        isRound: false,
                        uncheckedColor: Colors.black,
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  Row(
                    children: [
                      const Text('No'),
                      horizontalSpaceSmall,
                      RoundCheckBox(
                        onTap: (selected) {},
                        size: 24,
                        isRound: false,
                        uncheckedColor: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Question 3
            Container(
              margin: const EdgeInsets.fromLTRB(25, 15, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      '3. Would you recommend our service to family and friends?'),
                  verticalSpaceSmall,
                  Row(
                    children: [
                      const Text('Yes'),
                      horizontalSpaceSmall,
                      RoundCheckBox(
                        onTap: (selected) {},
                        size: 24,
                        isRound: false,
                        uncheckedColor: Colors.black,
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  Row(
                    children: [
                      const Text('No'),
                      horizontalSpaceSmall,
                      RoundCheckBox(
                        onTap: (selected) {},
                        size: 24,
                        isRound: false,
                        uncheckedColor: Colors.black,
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  Row(
                    children: [
                      const Text('Maybe'),
                      horizontalSpaceSmall,
                      RoundCheckBox(
                        onTap: (selected) {},
                        size: 24,
                        isRound: false,
                        uncheckedColor: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Question 4
            Container(
              margin: const EdgeInsets.fromLTRB(25, 15, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('4. How would you rate our service?'),
                  verticalSpaceSmall,
                  Row(
                    children: [
                      const Text('Fair'),
                      horizontalSpaceSmall,
                      RoundCheckBox(
                        onTap: (selected) {},
                        size: 24,
                        isRound: false,
                        uncheckedColor: Colors.black,
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  Row(
                    children: [
                      const Text('Very Good'),
                      horizontalSpaceSmall,
                      RoundCheckBox(
                        onTap: (selected) {},
                        size: 24,
                        isRound: false,
                        uncheckedColor: Colors.black,
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  Row(
                    children: [
                      const Text('Excellent'),
                      horizontalSpaceSmall,
                      RoundCheckBox(
                        onTap: (selected) {},
                        size: 24,
                        isRound: false,
                        uncheckedColor: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Question 5
            Container(
              margin: const EdgeInsets.fromLTRB(25, 15, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('5. Did you enjoy our Parking Service?'),
                  verticalSpaceSmall,
                  Row(
                    children: [
                      const Text('Yes'),
                      horizontalSpaceSmall,
                      RoundCheckBox(
                        onTap: (selected) {},
                        size: 24,
                        isRound: false,
                        uncheckedColor: Colors.black,
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  Row(
                    children: [
                      const Text('No'),
                      horizontalSpaceSmall,
                      RoundCheckBox(
                        onTap: (selected) {},
                        size: 24,
                        isRound: false,
                        uncheckedColor: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //Submission button
            GestureDetector(
              onTap: viewModel.nToMainPage,
              child: Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 20),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  @override
  FeedbackViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FeedbackViewModel();
}
