import 'package:flutter/material.dart';
import 'package:car_park_manager/ui/common/app_colors.dart';
import 'package:car_park_manager/ui/common/ui_helpers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'notice_sheet_model.dart';

class NoticeSheet extends StackedView<NoticeSheetModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const NoticeSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NoticeSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      color: Colors.white,
      height: 100.0,
      child: Column(
        children: [
          const Text(
            'Choose Profile Picture',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  // viewModel.takePhoto(ImageSource.gallery);
                  viewModel.pickImage(context, ImageSource.gallery);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.image),
                label: const Text(
                  'Gallary',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  // viewModel.takePhoto(ImageSource.camera);
                  viewModel.pickImage(context, ImageSource.camera);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.camera),
                label: const Text(
                  'Camera',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  NoticeSheetModel viewModelBuilder(BuildContext context) => NoticeSheetModel();
}
