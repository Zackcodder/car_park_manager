import 'dart:io';

import 'package:car_park_manager/app/app.bottomsheets.dart';
import 'package:car_park_manager/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  File? _image;
  File? get image => _image;
  final _bottomSheetService = locator<BottomSheetService>();

  // for uploading of profile picture
  // Widget imageProfile() {
  //   return Center(
  //     heightFactor: 2,
  //     child: Stack(
  //       children: [
  //         CircleAvatar(
  //           backgroundColor: Colors.black,
  //           radius: 80.0,
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(50.0),
  //             child: image == null
  //                 ? const Icon(
  //                     Icons.person,
  //                     size: 50,
  //                     color: Colors.white,
  //                   )
  //                 : CircleAvatar(
  //                     radius: 80,
  //                     backgroundImage: FileImage(_image),
  //                   ),
  //           ),
  //         ),
  //         Positioned(
  //           bottom: 20.0,
  //           right: 10.0,
  //           child: InkWell(
  //             onTap: () {
  //               showUpdateStatusBottomSheet();
  //             },
  //             child: const Icon(
  //               Icons.camera_alt,
  //               color: Colors.blue,
  //               size: 30.0,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  //Bottom pop up menu to upload picture form camera or gallary
  showUpdateStatusBottomSheet() async {
    setBusy(true);
    final res = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
    );
  }

  // void takePhoto(ImageSource source) async {
  //   final picker = ImagePicker();
  //   final pickImage = await picker.pickImage(source: source);
  //   if (pickImage != null) {
  //     _image = File(pickImage.path);
  //     notifyListeners();
  //   }
  // }

  // profile details

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
