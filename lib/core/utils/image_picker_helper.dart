import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  ImagePickerHelper._();

  static final ImagePickerHelper instance = ImagePickerHelper._();

  final ImagePicker _pickerHelper = ImagePicker();

  Future<File?> pickImageFormSource(
      {required imgSourcetype, int imageQuality = 50}) async {
    final pickedFile = await _pickerHelper.pickImage(
        source: imgSourcetype, imageQuality: imageQuality);
    return pickedFile != null ? File(pickedFile.path) : null;
  }
}
