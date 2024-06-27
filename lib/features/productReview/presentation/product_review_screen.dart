import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoesly/core/presentation/resources/custom_text_style.dart';
import 'package:shoesly/core/presentation/resources/theme_helpers.dart';
import 'package:shoesly/core/presentation/widgets/appbar/custom_appbar.dart';
import 'package:shoesly/core/presentation/widgets/custom_icon_button.dart';
import 'package:shoesly/core/utils/size_utils.dart';
import 'package:shoesly/features/productReview/data/models/review_model.dart';
import 'package:shoesly/features/productReview/presentation/controller/review_controller.dart';
import 'package:shoesly/features/productReview/presentation/controller/review_tab_controller.dart';
import 'widgets/review_widget.dart';

class ProductReviewScreen extends GetWidget<ReviewTabController> {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbarSection(),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 30.v,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.h),
                child: _buildTabview(),
              ),
              SizedBox(
                height: 30.v,
              ),
              GetBuilder<ReviewController>(
                  init: ReviewController(),
                  builder: (context) {
                    // final reviewListinfo =
                    //     Get.find<ReviewController>().reviewListinfo;
                    final reviewApiResponse =
                        Get.find<ReviewController>().reviewApireponse;

                    return reviewApiResponse.isInitial
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          )
                        : reviewApiResponse.data.isEmpty
                            ? const Center(
                                child: SizedBox(
                                  child: Text('NO Review Data'),
                                ),
                              )
                            : SizedBox(
                                height: 967.v,
                                child: TabBarView(
                                    controller: controller.tabviewContainer,
                                    children: [
                                      ReviewWidget(reviewitems: reviewListinfo),
                                      ReviewWidget(reviewitems: reviewListinfo),
                                      ReviewWidget(reviewitems: reviewListinfo),
                                      ReviewWidget(reviewitems: reviewListinfo),
                                      ReviewWidget(reviewitems: reviewListinfo),
                                      ReviewWidget(reviewitems: reviewListinfo)
                                    ]));
                  }),
            ],
          )),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppbarSection() {
    return CustomeAppBar(
      styleType: Style.mediumFill,
      height: 80.v,
      title: const SizedBox(height: 26, child: Text('Review(1045)')),
      titleTextStyle: CustomTextStyles.titleMediumBlack9001,
      centerTitle: true,
      leadingWidth: 54.h,
      leading: CustomIconButton(
        icon: Icons.arrow_back_rounded,
        onPressed: () => Get.back(),
      ),
      action: [
        Container(
          height: 24.adaptSize,
          margin: EdgeInsets.fromLTRB(30.h, 16.h, 30.h, 15.h),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.star,
                    size: 20,
                    color: Color(0xFFFCD240),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      '4.5',
                      style: CustomTextStyles.titleSmallBlack90001,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
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
            child: Text(
              'All',
            ),
          ),
          Tab(
            child: Text(
              '5 Star',
            ),
          ),
          Tab(
            child: Text(
              '4 Star',
            ),
          ),
          Tab(
            child: Text(
              '3 Star',
            ),
          ),
          Tab(
            child: Text(
              '2 Star',
            ),
          ),
          Tab(
            child: Text(
              '1 Star',
            ),
          )
        ],
      ),
    );
  }
}
