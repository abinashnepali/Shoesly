import 'package:get/get.dart';
import 'package:shoesly/features/home_tab_container/presentation/controller/home_tab_controller.dart';

class HomeTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeTabContainerController());
  }
}
