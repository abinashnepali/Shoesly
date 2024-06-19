import 'package:get/get.dart';
import 'package:shoesly/features/product_details/presentation/controller/product_addto_cart_buttonsheet_controller.dart';
import 'package:shoesly/features/product_details/presentation/controller/product_detail_controller.dart';

class ProductDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductAddtoCartButtonSheetController());
    Get.put(ProductDetailController());
  }
}
