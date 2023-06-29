import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'dart:io';

class NoticeSheetModel extends BaseViewModel {
  File? _image;
  File? get image => _image;
  // late PickedFile _imageFile;

  // final ImagePicker _picker = ImagePicker();

  void takePhoto(ImageSource source) async {
    final picker = ImagePicker();
    final pickImage = await picker.pickImage(source: source);
    // final pickedFile = await _picker.pickMedia();
    // _imageFile = pickedFile as PickedFile;
    if (pickImage != null) {
      _image = File(pickImage.path);
      notifyListeners();
    }
  }

  Future<void> pickImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      _image = File(pickedImage.path);
      notifyListeners();
    }
  }
}
