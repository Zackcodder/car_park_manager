import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'qrscanner_viewmodel.dart';

class QrscannerView extends StackedView<QrscannerViewModel> {
  const QrscannerView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    QrscannerViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            // This call the build function that display and build the scanner interface
            child: viewModel.buildQrView(context),
          ),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (viewModel.result != null)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Display the bar code type extracted
                        Text(
                          'Barcode Type: ${describeEnum(viewModel.result!.format)}',
                          style: const TextStyle(
                            fontSize: 23,
                          ),
                        ),
                        //Display the date embedded in the barcode or qr code
                        Text(
                          'Data: ${viewModel.result!.code}',
                          style: const TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ],
                    )
                  else
                    const Text('Scan a code'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //Handles the switching of flash light mode on the device
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await viewModel.controller?.toggleFlash();
                            },
                            child: FutureBuilder(
                              future: viewModel.controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Text('Flash: ${snapshot.data}');
                              },
                            )),
                      ),
                      //Handles the switching of camera position on the device
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await viewModel.controller?.flipCamera();
                            },
                            child: FutureBuilder(
                              future: viewModel.controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Text(
                                      'Camera facing ${describeEnum(snapshot.data!)}');
                                } else {
                                  return const Text('loading');
                                }
                              },
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //Pause button
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await viewModel.controller?.pauseCamera();
                          },
                          child: const Text('pause',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      //Resume button
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await viewModel.controller?.resumeCamera();
                          },
                          child: const Text('resume',
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  QrscannerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      QrscannerViewModel();
}
