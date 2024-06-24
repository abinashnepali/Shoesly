import 'package:get/get.dart';
import 'package:shoesly/core/utils/constants.dart';
import 'package:shoesly/features/cart/data/models/product_details_cart_model.dart';

class CartItemController extends GetxController {
  void addRemoveItemOnCart({bool? addItem, bool? removeItem, required index}) {
    int quanity = 0;
    if (addItem ?? false) {
      productDetailsCartList[index].numberOfQuantity?.value++;
    }
    if (removeItem ?? false) {
      if (productDetailsCartList[index].numberOfQuantity?.value != 0) {
        productDetailsCartList[index].numberOfQuantity?.value--;
      }
    }
  }
}
