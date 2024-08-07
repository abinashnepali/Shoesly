import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:shoesly/core/presentation/resources/custom_text_style.dart';
import 'package:shoesly/core/presentation/resources/theme_helpers.dart';
import 'package:shoesly/core/presentation/routes/app_routes.dart';
import 'package:shoesly/core/presentation/widgets/appbar/custom_appbar.dart';
import 'package:shoesly/core/presentation/widgets/custom_icon_button.dart';
import 'package:shoesly/core/presentation/widgets/custom_image_view.dart';
import 'package:shoesly/core/presentation/widgets/custom_outline_button.dart';
import 'package:shoesly/core/presentation/widgets/custom_rating_bar.dart';
import 'package:shoesly/core/utils/common_widgets.dart';
import 'package:shoesly/core/utils/size_utils.dart';
import 'package:shoesly/features/discover/data/models/product_details_model.dart';
import 'package:shoesly/features/productReview/presentation/controller/review_controller.dart';
import 'package:shoesly/features/product_details/data/models/sizeselection_item_model.dart';
import 'package:shoesly/features/product_details/presentation/widgets/product_addto_cart_buttonsheet.dart';
import 'package:shoesly/features/product_details/presentation/widgets/silder_widget.dart';
import 'package:shoesly/features/product_details/presentation/widgets/sizeselection_item_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductDetailsModel? productDetailsModel;

  const ProductDetailsScreen({super.key, required this.productDetailsModel});

  void _showAddToCartBottomSheet(BuildContext context) {
    if (Get.isBottomSheetOpen == null || !Get.isBottomSheetOpen!) {
      Get.bottomSheet(
        ProductBottomSheet(
          productDetailsModel: productDetailsModel,
        ),
        isScrollControlled: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (productDetailsModel == null) {
      return Scaffold(
        appBar: _buildAppbar(),
        body: const Center(
          child: Text('No product details available'),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                SizedBox(
                  height: 10.v,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5.v),
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProductImages(),
                      SizedBox(
                        height: 35.v,
                      ),
                      Text(
                        productDetailsModel!.productName!,
                        style: CustomTextStyles.titleLargeBlack900,
                      ),
                      SizedBox(
                        height: 10.v,
                      ),
                      Row(
                        children: [
                          CustomRatingBar(
                            initialRating: productDetailsModel!.rating!,
                            color: const Color(0xFFFCD240),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.h),
                            child: Text(
                              productDetailsModel!.rating!.toString(),
                              style: theme.textTheme.labelMedium,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.h),
                            child: Text(
                              productDetailsModel!.reviewCount!,
                              style: theme.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 33.v,
                      ),
                      Text(
                        'Size',
                        style: theme.textTheme.titleSmall,
                      ),
                      SizedBox(
                        height: 12.v,
                      ),
                      _buildSizeSection(),
                      SizedBox(
                        height: 20.v,
                      ),

                      Text(
                        "Description",
                        style: theme.textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 13.v,
                      ),

                      Container(
                        width: 300.h,
                        margin: EdgeInsets.only(right: 14.h),
                        child: Text(
                          productDetailsModel!.description!,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodyMediumGray600.copyWith(
                            height: 1.71,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.v,
                      ),

                      ///Review

                      _buildReviewList(),
                      SizedBox(
                        height: 27.v,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: CommonWidget.bottomPriceAndCart(
            buttonLabel: 'Add to Cart',
            labelText: 'Price',
            onPressed: () {
              _showAddToCartBottomSheet(context);
            },
            price: '\$${productDetailsModel!.price}'),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return CustomeAppBar(
      leadingWidth: 55.h,
      leading: CustomIconButton(
        icon: Icons.arrow_back_rounded,
        onPressed: () => Get.back(),
      ),
      action: [
        Container(
          height: 24.adaptSize,
          width: 28.adaptSize,
          margin: EdgeInsets.fromLTRB(30.h, 16.h, 30.h, 15.h),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              CustomIconButton(
                  icon: Icons.shopping_bag_outlined,
                  color: theme.colorScheme.onPrimaryContainer,
                  iconSize: 24,
                  onPressed: () => Get.toNamed(Routes.cartScreen)),
              Visibility(
                visible: false,
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

  PreferredSizeWidget _buildAppbarSection() {
    return CustomeAppBar(
      leadingWidth: 54.h,
      leading: CustomIconButton(
        icon: Icons.arrow_back_rounded,
        onPressed: () => Get.back(),
      ),
      action: [
        Container(
          height: 24.adaptSize,
          width: 28.adaptSize,
          margin: EdgeInsets.fromLTRB(30.h, 16.h, 30.h, 15.h),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              CustomIconButton(
                onPressed: () {},
                color: theme.colorScheme.onPrimaryContainer,
                icon: Icons.shopping_bag_outlined,
              ),
              Visibility(
                visible: false,
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

  // Product Image

  Widget _buildProductImages() {
    return SizedBox(
      height: 315.adaptSize,
      width: 315.adaptSize,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CarouselSlider.builder(
              itemCount: 4,
              options: CarouselOptions(
                height: 315.adaptSize,
                initialPage: 0,
                autoPlay: true,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                onPageChanged: ((index, reason) {
                  //contoller.sliderIndex.value = index
                }),
              ),
              itemBuilder: (context, index, realIndex) {
                return SliderWidget(
                  imagePath: productDetailsModel?.productImage,
                );
              }),
        ],
      ),
    );
  }

  Widget _buildSizeSection() {
    return Wrap(
        runSpacing: 15.v,
        spacing: 15.h,
        children: List.generate(sizeListInfo.length, (index) {
          return SizeselectionItemWidget(
              sizeinfo: sizeListInfo[index], index: index);
        }));
  }

  Widget _buildReviewList() {
    String reviewText = 'Review (1045)';

    return GetBuilder<ReviewController>(
        init: ReviewController(),
        builder: (context) {
          final reviewListinfo = Get.find<ReviewController>().reviewListinfo;

          return reviewListinfo.isEmpty
              ? const SizedBox.shrink()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reviewText,
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 12.v,
                    ),
                    SizedBox(
                      height: 400.v,
                      child: ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final item = reviewListinfo[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomImageView(
                                      imagePath: item.imagePath,
                                      height: 40.adaptSize,
                                      width: 40.adaptSize,
                                      radius: BorderRadius.circular(20.h),
                                      margin: EdgeInsets.only(bottom: 57.v),
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 15.h, top: 3.v),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _buildReviewInfo(
                                              todayText: item.time!,
                                              userName: item.userName!),
                                          SizedBox(
                                            height: 12.v,
                                          ),
                                          CustomRatingBar(
                                            initialRating: item.rating,
                                            color: const Color(0xFFFCD240),
                                          ),
                                          Container(
                                            width: 247.h,
                                            margin:
                                                EdgeInsets.only(right: 11.h),
                                            child: Text(
                                              item.message!,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.bodySmall!
                                                  .copyWith(height: 1.83),
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                                SizedBox(
                                  height: 27.v,
                                ),
                              ],
                            );
                          }),
                    ),
                    CustomOutlineButton(
                      text: 'See All Review'.toUpperCase(),
                      onPressed: () => Get.toNamed(Routes.productReview),
                    )
                  ],
                );
        });
  }

  Widget _buildReviewInfo(
      {required String userName, required String todayText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          userName,
          style: CustomTextStyles.titleSmallBlack90001.copyWith(
            color: appTheme.black90001,
          ),
        ),
        Text(
          todayText,
          style: CustomTextStyles.bodySmallGray400.copyWith(
            color: appTheme.gray400,
          ),
        ),
      ],
    );
  }

  // Widget _buildPriceAndCart() {
  //   return Container(
  //     height: 90.h,
  //     margin: EdgeInsets.only(left: 30.h, right: 30.h, bottom: 19.v),
  //     decoration: AppDecoration.OutlinedBlueGray,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               'Price',
  //               style: CustomTextStyles.bodySmallGray400,
  //             ),
  //             Padding(
  //               padding: EdgeInsets.only(top: 11.v),
  //               child: Text(
  //                 '\$235.00',
  //                 style: CustomTextStyles.titleLargeBlack900,
  //               ),
  //             )
  //           ],
  //         ),
  //         CustomElevatedButton(
  //           width: 156.h,
  //           text: 'Add to Cart'.toUpperCase(),
  //           buttonTextStyle: CustomTextStyles.labelsmallWhite
  //               .copyWith(fontWeight: FontWeight.w400),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
