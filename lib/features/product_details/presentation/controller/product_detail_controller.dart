import 'package:get/get.dart';
import 'package:shoesly/features/product_details/data/models/sizeselection_item_model.dart';

class ProductDetailController extends GetxController {
  void updateSizeSelected({required int index}) {
    for (int i = 0; i < sizeListInfo.length; i++) {
      sizeListInfo[i].isSizeSelected?.value = i == index;
    }
  }
}
