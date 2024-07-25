import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shoesly/core/data/firebase/firebase_services.dart';
import 'package:shoesly/core/presentation/resources/custom_text_style.dart';
import 'package:shoesly/core/presentation/widgets/toast.dart';
import 'package:shoesly/core/utils/constants_message.dart';
import 'package:shoesly/core/utils/image_picker_helper.dart';
import 'package:shoesly/features/user/data/model/usermodel.dart';
import 'package:shoesly/features/user/data/repository/profile_repository.dart';

class PorfileController extends GetxController {
  File? imageFile;
  Usermodel usermodelInfo = Usermodel();

  late ProfileRepository _profileRepository;

  RxBool isLoding = false.obs;

  RxBool isPeremissionGranted = false.obs;

  late Uint8List? imgUint;

  @override
  void onInit() {
    super.onInit();
    _profileRepository = Get.find<ProfileRepository>();

    getUserDetails();
  }

  void getUserDetails() async {
    isLoding.value = true;
    final userinfo = FirebaseService.firebaseAuth.currentUser;
    if (userinfo == null) {
      showFailureToast(ConstantsMessage.nouserDataAvailable);
      return;
    } else {
      final response = await _profileRepository.getUserDetails(userinfo.uid);
      if (response.hasError) {
        showFailureToast(response.error.toString());
      }

      if (response.hasData) {
        usermodelInfo = response.data;
      }
    }
    isLoding.value = false;
    update();
  }

  Future<void> updateProfile(Usermodel usermodel) async {
    isLoding.value = true;

    if (!FirebaseService.isAuthenticated()) {
      showToast(ConstantsMessage.userNotLogIn);
      return;
    }
    usermodel.photoFile = imageFile;
    final response =
        await _profileRepository.updateProfile(usermodel, imageFile: uIntImage);

    if (response.hasError) {
      showFailureToast(response.error.toString());
    }
    if (response.hasData) {
      usermodelInfo = response.data;
    }
    isLoding.value = false;
    update();
  }

  void retrieveImageFromMobile(ImageSource source) async {
    try {
      if (isPeremissionGranted.value) {
        File? image = await ImagePickerHelper.instance
            .pickImageFormSource(imgSourcetype: source);
        if (image == null) {
          showFailureToast(ConstantsMessage.noImageAvailable);
          return;
        }
        imgUint = await image.readAsBytes();
        imageFilePath = image;
        update();
      } else {
        showFailureToast(ConstantsMessage.permissionDenied);
      }
    } catch (e) {
      showFailureToast(e.toString());
    }
    isLoding.value = false;
  }

  Future<bool> requestPermission() async {
    if (isPeremissionGranted.value) {
      return true;
    }
    PermissionStatus status = await Permission.storage.status;
    if (status.isGranted) {
      return true;
    } else {
      // Show the custom dialog here
      final permissionflag = await _showPermissionDialog();

      return permissionflag;
    }
  }

  Future<bool> _showPermissionDialog() async {
    bool? result = await Get.dialog(
      AlertDialog(
        title: const Text('Permission Needed'),
        content: const Text(ConstantsMessage.permissionRquestmsg),
        alignment: Alignment.center,
        actions: [
          TextButton(
            onPressed: () async {
              isPeremissionGranted.value = true;
              Get.back(result: true);
            },
            child: Text(
              'Yes',
              style: CustomTextStyles.bodyMediumBlack900,
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: false);
            },
            child: Text(
              'No',
              style: CustomTextStyles.bodyMediumBlack900,
            ),
          ),
        ],
      ),
    );
    if (result == true) {
      return true;
    }
    return false;
  }

  set imageFilePath(File fileinfo) {
    imageFile = fileinfo;
    update();
  }

  File? get getImageFile => imageFile;

  Uint8List? get uIntImage => imgUint;

  Usermodel get userinfo => usermodelInfo;
}
