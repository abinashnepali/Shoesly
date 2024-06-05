import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLoadingDialog {
  static bool isProgessVisible = false;

  static void showProgressDialog({bool isCancellable = false}) async {
    if (!isProgessVisible) {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 4,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.white,
            ),
          ),
        ),
        barrierDismissible: isCancellable,
      );
      isProgessVisible = true;
    }
  }

  static void hideProgressDialog() {
    if (isProgessVisible) Get.back();
    isProgessVisible = false;
  }
}
