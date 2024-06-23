import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shoesly/crore/data/firebase/network_info.dart';

class CoreBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(InternetConnectionChecker(), permanent: true)
      ..put<NetworkInfo>(NetworkInfoImpl(
          dataConnectionChecker: Get.find<InternetConnectionChecker>()));
  }
}
