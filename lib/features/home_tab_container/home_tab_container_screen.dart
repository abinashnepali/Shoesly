import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesly/crore/presentation/resources/theme_helpers.dart';
import 'package:shoesly/crore/utils/size_utils.dart';
import 'package:shoesly/features/discover/presentation/discover_screen.dart';
import 'package:shoesly/features/home_tab_container/presentation/controller/home_tab_controller.dart';

class HomeTabContainerScreen extends GetWidget<HomeTabContainerController> {
  const HomeTabContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 20.v,
            ),
            _buildTabview(),
            Expanded(
                child: SizedBox(
              height: 967.v,
              child: TabBarView(
                  controller: controller.tabviewContainer,
                  children: [
                    DiscoverScreen(),
                    DiscoverScreen(),
                    DiscoverScreen(),
                    DiscoverScreen(),
                    DiscoverScreen(),
                  ]),
            ))
          ],
        ),
      ),
    ));
  }

  //section widget

  Widget _buildTabview() {
    return SizedBox(
      height: 24.v,
      width: 347.h,
      child: TabBar(
        controller: controller.tabviewContainer,
        isScrollable: true,
        labelColor: appTheme.black900,
        unselectedLabelColor: appTheme.gray400,
        tabs: const [
          Tab(
            child: Text('All'),
          ),
          Tab(
            child: Text('Nike'),
          ),
          Tab(
            child: Text('Jordan'),
          ),
          Tab(
            child: Text('Adidas'),
          ),
          Tab(
            child: Text('Reebok'),
          )
        ],
      ),
    );
  }
}
