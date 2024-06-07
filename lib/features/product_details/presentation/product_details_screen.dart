import 'dart:js';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesly/crore/presentation/resources/app_decoration.dart';

import 'package:shoesly/crore/presentation/resources/custom_text_style.dart';
import 'package:shoesly/crore/presentation/resources/theme_helpers.dart';
import 'package:shoesly/crore/presentation/widgets/appbar/custom_appbar.dart';
import 'package:shoesly/crore/presentation/widgets/custom_elevated_button.dart';
import 'package:shoesly/crore/presentation/widgets/custom_icon_button.dart';
import 'package:shoesly/crore/presentation/widgets/custom_image_view.dart';
import 'package:shoesly/crore/presentation/widgets/custom_outline_button.dart';
import 'package:shoesly/crore/presentation/widgets/custom_rating_bar.dart';
import 'package:shoesly/crore/utils/size_utils.dart';
import 'package:shoesly/features/discover/data/models/productgrid_item_model.dart';
import 'package:shoesly/features/productReview/data/models/review_model.dart';
import 'package:shoesly/features/product_details/data/models/sizeselection_item_model.dart';
import 'package:shoesly/features/product_details/presentation/widgets/sizeselection_item_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductgirdItemModel? productDetailsModel;

  ProductDetailsScreen({super.key, required this.productDetailsModel});

  final String productDesc =
      'Engineered to crush any movement-base woekout, these On sneakers enhance the label\'s original Cloud sneakers with cutting edge techloges for a pair';

  @override
  Widget build(BuildContext context) {
    if (productDetailsModel == null) {
      return Scaffold(
        appBar: _buildAppbar(),
        body: Center(
          child: Text('No product details available'),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(
                height: 10.v,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(bottom: 5.v),
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///   _buildProductImages(),
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
                            initialRating:
                                double.parse(productDetailsModel!.rating!),
                            color: Color(0xFFFCD240),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.h),
                            child: Text(
                              productDetailsModel!.rating!,
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
                          productDesc,
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

                      _buildReviewList(reviewListinfo),
                      SizedBox(
                        height: 27.v,
                      ),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
        bottomNavigationBar: _buildPriceAndCart(),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return CustomeAppBar(
      leadingWidth: 54.h,
      leading: CustomIconButton(
        icon: Icons.arrow_back_rounded,
        onPressed: () => Get.back(),
      ),
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
          // CarouselSlider.builder(
          //   itemCount: 4,
          //   options: CarouselOptions(
          //     height: 315.adaptSize,
          //     initialPage: 0,
          //     autoPlay: true,
          //     viewportFraction: 1.0,
          //     enableInfiniteScroll: false,
          //     scrollDirection: Axis.horizontal,
          //     onPageChanged: ((index, reason) {
          //       //contoller.sliderIndex.value = index
          //     }),
          //   ),
          //   itemBuilder: (context, index, realIndex) {
          //   //  Slider

          //   }
          //   ),
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
            sizeinfo: sizeListInfo[index],
          );
        }));
  }

  Widget _buildReviewList(List<ReviewModel> reviewListinfo) {
    String reviewText = 'Review (1045)';

    return Column(
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
                          padding: EdgeInsets.only(left: 15.h, top: 3.v),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildReviewInfo(
                                  todayText: item.time!,
                                  userName: item.userName!),
                              SizedBox(
                                height: 12.v,
                              ),
                              CustomRatingBar(
                                initialRating: item.rating,
                                color: Color(0xFFFCD240),
                              ),
                              Container(
                                width: 247.h,
                                margin: EdgeInsets.only(right: 11.h),
                                child: Text(
                                  item.reviewMessage!,
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
        )
      ],
    );
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

  Widget _buildPriceAndCart() {
    return Container(
      height: 90.h,
      margin: EdgeInsets.only(left: 30.h, right: 30.h, bottom: 19.v),
      decoration: AppDecoration.OutlinedBlueGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: CustomTextStyles.bodySmallGray400,
              ),
              Padding(
                padding: EdgeInsets.only(top: 11.v),
                child: Text(
                  '\$235.00',
                  style: CustomTextStyles.titleLargeBlack900,
                ),
              )
            ],
          ),
          CustomElevatedButton(
            width: 156.h,
            text: 'Add to Cart'.toUpperCase(),
            buttonTextStyle: CustomTextStyles.labelsmallWhite
                .copyWith(fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
