// ignore_for_file: sized_box_for_whitespace

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:car_park_manager/ui/common/app_colors.dart';
import 'package:car_park_manager/ui/common/ui_helpers.dart';
import 'main_page_viewmodel.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({Key? key}) : super(key: key);

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  late GoogleMapController mapController;
  final Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainPageViewModel>.reactive(
      onViewModelReady: (viewModel) async {
        await viewModel.init();
        await viewModel.fetchPlaces();
        viewModel.placeLists;
      },
      viewModelBuilder: () => MainPageViewModel(),
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
              //Drawer
              drawer: Container(
                width: 200,
                color: Colors.white,
                child: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      verticalSpaceLarge,
                      verticalSpace(130),

                      //QRcode Scanner button
                      ListTile(
                        leading: const Icon(
                          Icons.barcode_reader,
                          color: Colors.black,
                        ),
                        title: const Text(
                          'Scan QR and Bar Codes',
                        ),
                        onTap: viewModel.nToQrCodeScan,
                      ),
                      verticalSpaceSmall,

                      //QRcode Generator button
                      ListTile(
                        leading: const Icon(
                          Icons.qr_code_2,
                          color: Colors.black,
                        ),
                        title: const Text(
                          'Generate BarCode',
                        ),
                        onTap: viewModel.nToQrCodeGen,
                      ),
                      verticalSpaceSmall,

                      //FeedBack button
                      ListTile(
                        leading: const Icon(
                          Icons.feedback_outlined,
                          color: Colors.black,
                        ),
                        title: const Text(
                          'Customer Feedback',
                        ),
                        onTap: viewModel.nToFeedBack,
                      ),

                      verticalSpaceSmall,

                      //Profiles Page
                      ListTile(
                        leading: const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        title: const Text(
                          'Profile',
                        ),
                        onTap: viewModel.nToProfilePage,
                      ),

                      verticalSpaceSmall,

                      //SignOut button
                      ListTile(
                        leading: const Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                        title: const Text(
                          'SignOut',
                        ),
                        onTap: viewModel.signOut,
                      ),
                    ],
                  ),
                ),
              ),
              body: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(
                      myLocationEnabled: true,
                      trafficEnabled: true,
                      myLocationButtonEnabled: true,
                      zoomGesturesEnabled: true,
                      zoomControlsEnabled: false,
                      mapType: MapType.normal,
                      circles: viewModel.circles,
                      initialCameraPosition: viewModel.googlePlex,
                      onMapCreated: (GoogleMapController controller) async {
                        mapController = controller;
                        _controller.complete(controller);

                        final position = await viewModel.currentPosition;

                        mapController.animateCamera(CameraUpdate.newLatLng(
                            viewModel.convertPositionToLatLng(position)));
                      },
                    ),
                  ),
                  //Menu button
                  Positioned(
                    left: 20,
                    top: 50,
                    child: Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: const CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.menu,
                            color: Colors.black,
                          ),
                          backgroundColor: Colors.white,
                        ),
                      );
                    }),
                  ),
                  //Notification Button
                  Positioned(
                    top: 500,
                    left: 30,
                    child: Container(
                      width: 300,
                      decoration: const BoxDecoration(
                          color: kcBlue,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: MaterialButton(
                        height: 60,
                        onPressed: viewModel.triggerNotifications,
                        child: const Text('Send Notification'),
                      ),
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}
