import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductAddtoCartButtonSheetController extends GetxController {
  TextEditingController quantitycontroller = TextEditingController();

  var golbalTotalPrice = 00.00.obs;

  @override
  void onClose() {
    super.onClose();
    quantitycontroller.dispose();
  }

  addRemoveQuanity(
      {bool? add = false, bool? remove = false, required double price}) {
    bool hasvalue = quantitycontroller.text.isNotEmpty;

    if (!hasvalue) {
      quantitycontroller.text = '0';
    }

    if (add == true && int.parse(quantitycontroller.text) < 21) {
      quantitycontroller.text =
          (int.parse(quantitycontroller.text) + 1).toString();
    }
    if (int.parse(quantitycontroller.text) > 1 && remove == true) {
      int currentValue = int.tryParse(quantitycontroller.text) ?? 0;
      if (currentValue > 0) {
        quantitycontroller.text = (currentValue - 1).toString();
      }
    }
    updateTotalPrice(price);

    //update();
  }

  updateTotalPrice(double pricePerItem) {
    double totalprice = 0;
    if (quantitycontroller.text.isNotEmpty) {
      totalprice = pricePerItem * double.parse(quantitycontroller.text);
    } else {
      totalprice = 0;
    }
    golbalTotalPrice.value = totalprice;
  }
}
