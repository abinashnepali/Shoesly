import 'package:get/get.dart';
import 'package:shoesly/crore/data/firebase/network_info.dart';
import 'package:shoesly/features/productReview/data/repository/review_repository.dart';
import 'package:shoesly/features/productReview/data/repository/review_repositoryimpl.dart';
import 'package:shoesly/features/productReview/presentation/controller/review_controller.dart';
import 'package:shoesly/features/productReview/presentation/controller/review_tab_controller.dart';

class ReviewControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get
      // ..lazyPut(() => ReviewTabController())
      ..put<ReviewRepository>(
          ReviewRepositoryimpl(networkInfo: Get.find<NetworkInfo>()))
      ..put<ReviewTabController>(ReviewTabController())
      ..put<ReviewController>(ReviewController());
  }
}
