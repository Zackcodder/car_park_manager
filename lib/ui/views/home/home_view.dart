import 'package:car_park_manager/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
          // backgroundColor: Colors.blue,
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
          ),
          body: Column(
            children: [],
          )),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
