import 'package:get/get.dart';
import 'package:shoesly/core/data/firebase/network_info.dart';
import 'package:shoesly/features/cart/data/repository/cart_repository.dart';
import 'package:shoesly/features/cart/data/repository/cart_repository_impl.dart';
import 'package:shoesly/features/cart/presentation/controller/cart_item_controller.dart';
import 'package:shoesly/features/cart/presentation/controller/local_cart_controller.dart';

class CartControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..put<CartRepository>(
          CartRepositoryImpl(networkInfo: Get.find<NetworkInfo>()))
      ..put(CartItemController())
      ..put<LocalCartController>(LocalCartController(), permanent: true);
    //..lazyPut(() => LocalCartController(), fenix: true);
  }
}
