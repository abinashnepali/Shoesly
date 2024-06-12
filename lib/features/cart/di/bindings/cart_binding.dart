import 'package:get/get.dart';
import 'package:shoesly/features/cart/presentation/controller/cart_item_controller.dart';

class CartControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CartItemController());
  }
}
