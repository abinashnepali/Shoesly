import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesly/features/productReview/data/models/review_tab_model.dart';

class ReviewTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<ReviewTabContainerModel> hometabctrobj = ReviewTabContainerModel().obs;

  late TabController tabviewContainer =
      Get.put(TabController(vsync: this, length: 6));
}
