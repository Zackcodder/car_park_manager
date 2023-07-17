import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:car_park_manager/app/app.bottomsheets.dart';
import 'package:car_park_manager/app/app.locator.dart';

class ProfileViewModel extends BaseViewModel {
  File? _image;
  File? get image => _image;
  final _bottomSheetService = locator<BottomSheetService>();

  // static const String _imageBox = 'selected_image';
  // static const String _imageKey = 'image_path';

  //Bottom pop up menu to upload picture form camera or gallary
  showUpdateStatusBottomSheet() async {
    setBusy(true);
    final res = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
    );
  }

  // //Save Selected image
  // saveImage() async {
  //   if (_image != null) {
  //     final box = await Hive.openBox(_imageBox);
  //     await box.put(_imageKey, _image!.path);
  //     box.close();
  //   }
  // }

  // //load saved selected image
  // loadImage() async {
  //   final box = await Hive.openBox(_imageBox);
  //   final imagePath = box.get(_imageKey);
  //   box.close();
  //   if (imagePath != null) {
  //     _image = File(imagePath);
  //     notifyListeners();
  //   }
  // }

  takePhoto(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext ctx) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                onTap: () async {
                  final pickedImage = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    _image = File(pickedImage.path);
                    notifyListeners();
                  }
                  Navigator.pop(context); // Dismiss the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a Photo'),
                onTap: () async {
                  final pickedImage =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  if (pickedImage != null) {
                    _image = File(pickedImage.path);
                    notifyListeners();
                  }
                  Navigator.pop(context); // Dismiss the bottom sheet
                },
              ),
            ],
          );
        });
  }

  Widget nameTextField() {
    return const Center(
      child: Text(
        'Name : Mr Olaoluwa Bankole',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget jobTextField() {
    return const Center(
      child: Text(
        'Job Description:  Head of Research and Development',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget locationTextField() {
    return const Text(
      'Location:  Kwara State',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget departmentTextField() {
    return const Center(
      child: Text(
        'Department :  Research and Development',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
