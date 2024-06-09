import 'package:get/get.dart';
import 'package:shoesly/features/productReview/presentation/controller/review_tab_controller.dart';

class ReviewControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReviewTabController());
  }
}
