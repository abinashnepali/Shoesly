import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoesly/core/presentation/resources/theme_helpers.dart';
import 'package:shoesly/core/presentation/routes/app_routes.dart';
import 'package:shoesly/core/presentation/widgets/appbar/appbar_title.dart';
import 'package:shoesly/core/presentation/widgets/appbar/custom_appbar.dart';
import 'package:shoesly/core/utils/size_utils.dart';
import 'package:shoesly/features/cart/presentation/cart_screen.dart';
import 'package:shoesly/features/discover/presentation/discover_screen.dart';
import 'package:shoesly/features/home_tab_container/presentation/controller/home_tab_controller.dart';
import 'package:shoesly/features/setting/presentation/setting_screen.dart';

class HomeTabContainerScreen extends GetWidget<HomeTabContainerController> {
  HomeTabContainerScreen({super.key});

  final dashBoardCtr = Get.find<HomeTabContainerController>();

  @override
  Widget build(BuildContext context) {
    final mediaQSize = MediaQuery.sizeOf(context);
    return SafeArea(
        child: GetBuilder<HomeTabContainerController>(builder: (controller) {
      return Scaffold(
        // appBar: _buildAppbarSection(),
        bottomNavigationBar: _buildbottomNavigationBar(mediaQSize),
        body: IndexedStack(
          index: dashBoardCtr.tabindex,
          children: [HomeScreen(), CartScreen(), SettingScreen()],
        ),
      );
    }));
  }

  Widget _buildbottomNavigationBar(Size mediaQSize) {
    return GetBuilder<HomeTabContainerController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: NavigationBar(
          height: mediaQSize.height * 0.080,
          backgroundColor: appTheme.gray200,
          selectedIndex: dashBoardCtr.tabindex,
          onDestinationSelected: (i) {
            dashBoardCtr.changeTabIndex(i);
          },
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: const <NavigationDestination>[
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home,
              ),
              icon: Icon(
                Icons.home_outlined,
                size: 20,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.shopping_cart_checkout_rounded),
              icon: Icon(Icons.shopping_cart_checkout_rounded, size: 20),
              label: 'Person',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.settings_accessibility_sharp),
              icon: Icon(Icons.settings_accessibility_sharp, size: 20),
              label: 'Setting',
            ),
          ],
        ),
      );
    });
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final dashBoardCtr = Get.find<HomeTabContainerController>();
  // Appbar section

  PreferredSizeWidget _buildAppbarSection() {
    return CustomeAppBar(
      height: 80.v,
      title: AppbarTitle(text: 'Discover', margin: EdgeInsets.only(left: 31.h)),
      action: [
        Container(
          height: 40.adaptSize,
          width: 28.adaptSize,
          margin: EdgeInsets.fromLTRB(30.h, 16.h, 30.h, 15.h),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.cartScreen);
                  },
                  color: theme.colorScheme.onPrimaryContainer,
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    //FontAwesomeIcons.cartShopping,
                    size: 24,
                  )),
              Visibility(
                visible: true,
                child: Positioned(
                  top: 8,
                  right: 2,
                  child: Container(
                    height: 7.adaptSize,
                    width: 7.adaptSize,
                    margin: EdgeInsets.only(left: 16.h, top: 4.v, bottom: 12.v),
                    decoration: BoxDecoration(
                        color: appTheme.redA200,
                        borderRadius: BorderRadius.circular(4.h)),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbarSection(),
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
                  controller: dashBoardCtr.tabviewContainer,
                  children: const [
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
    );
  }

  //section widget

  Widget _buildTabview() {
    return SizedBox(
      height: 24.v,
      width: 347.h,
      child: TabBar(
        controller: dashBoardCtr.tabviewContainer,
        isScrollable: true,
        labelColor: appTheme.black900,
        unselectedLabelColor: appTheme.gray400,
        labelStyle: theme.textTheme.titleLarge,
        indicatorColor: Colors.transparent,
        dividerColor: appTheme.white,
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
