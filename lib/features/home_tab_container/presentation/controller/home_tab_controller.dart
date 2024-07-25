import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoesly/features/home_tab_container/data/model/homeModel.dart';

class HomeTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<HomeTabContainerModel> hometabctrobj = HomeTabContainerModel().obs;

  late TabController tabviewContainer =
      Get.put(TabController(vsync: this, length: 5));
  int tabindex = 0;

  void changeTabIndex(int index) {
    debugPrint('The value of index is $index');
    tabindex = index;
    update();
  }
}
