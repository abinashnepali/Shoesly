import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoesly/crore/presentation/resources/custom_text_style.dart';
import 'package:shoesly/crore/presentation/resources/theme_helpers.dart';
import 'package:shoesly/crore/utils/constants.dart';
import 'package:shoesly/crore/utils/size_utils.dart';
import 'package:shoesly/features/discover/presentation/controller/discover_controller.dart';
import 'package:shoesly/features/discover/presentation/widgets/productgrid_item_widget.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  final noImage = Constants.noImage;

  @override
  Widget build(BuildContext context) {
    debugPrint('The value is :$noImage');
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 33.v,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Stack(children: [
                    _buildProductGrid(),
                    Positioned(
                      bottom: 88,
                      left: 120,
                      child: SizedBox(
                        height: 28.h,
                        width: 90.v,
                        child: FloatingActionButton(
                          elevation: 0,
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.tune_outlined,
                                  color: appTheme.white,
                                ),
                                Text(
                                  'filter'.toUpperCase(),
                                  style: CustomTextStyles.labelsmallWhite,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          )),
    ));
  }

  Widget _buildProductGrid() {
    return GetBuilder<DiscoverController>(
        init: DiscoverController(),
        builder: (context) {
          final _productinfo =
              Get.find<DiscoverController>().productDetailsResponse;

          return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 230.v,
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.h,
                  crossAxisSpacing: 20.h),
              physics: const BouncingScrollPhysics(),
              itemCount: _productinfo.length,
              itemBuilder: (context, index) {
                return ProductGridItemWidget(_productinfo[index]);
              });
        });
  }
}
