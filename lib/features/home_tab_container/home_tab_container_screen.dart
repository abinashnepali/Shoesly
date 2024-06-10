import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shoesly/crore/presentation/resources/theme_helpers.dart';
import 'package:shoesly/crore/presentation/widgets/appbar/appbar_title.dart';
import 'package:shoesly/crore/presentation/widgets/appbar/custom_appbar.dart';
import 'package:shoesly/crore/utils/size_utils.dart';
import 'package:shoesly/features/discover/presentation/discover_screen.dart';
import 'package:shoesly/features/home_tab_container/presentation/controller/home_tab_controller.dart';

class HomeTabContainerScreen extends GetWidget<HomeTabContainerController> {
  const HomeTabContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                  controller: controller.tabviewContainer,
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
        labelStyle: theme.textTheme.titleLarge,
        indicatorColor: Colors.transparent,
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

  // Appbar section

  PreferredSizeWidget _buildAppbarSection() {
    return CustomeAppBar(
      height: 80.v,
      title: AppbarTitle(text: 'Discover', margin: EdgeInsets.only(left: 31.h)),
      action: [
        Container(
          height: 24.adaptSize,
          width: 28.adaptSize,
          margin: EdgeInsets.fromLTRB(30.h, 16.h, 30.h, 15.h),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              IconButton(
                  onPressed: () {},
                  color: theme.colorScheme.onPrimaryContainer,
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    //FontAwesomeIcons.cartShopping,
                    size: 24,
                  )),
              Visibility(
                visible: true,
                child: Positioned(
                  top: 12,
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
}
