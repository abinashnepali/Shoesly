import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shoesly/core/data/firebase/network_info.dart';
import 'package:shoesly/features/cart/presentation/controller/local_cart_controller.dart';

class CoreBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(InternetConnectionChecker(), permanent: true)
      ..put(LocalCartController(), permanent: true)
      ..put<NetworkInfo>(NetworkInfoImpl(
          dataConnectionChecker: Get.find<InternetConnectionChecker>()));
  }
}
