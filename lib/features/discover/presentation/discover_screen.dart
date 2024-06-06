import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesly/crore/presentation/resources/app_decoration.dart';
import 'package:shoesly/crore/presentation/resources/custom_text_style.dart';
import 'package:shoesly/crore/presentation/resources/theme_helpers.dart';
import 'package:shoesly/crore/presentation/widgets/custom_image_view.dart';
import 'package:shoesly/crore/utils/constants.dart';

import 'package:shoesly/crore/utils/size_utils.dart';
import 'package:shoesly/features/discover/data/models/productgrid_item_model.dart';
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
                                  Icons.align_horizontal_center_sharp,
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
                SizedBox(
                  height: 14.h,
                )
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
                  mainAxisExtent: 221.v,
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.h,
                  crossAxisSpacing: 15.h),
              physics: const BouncingScrollPhysics(),
              itemCount: _productinfo.length,
              itemBuilder: (context, index) {
                return ProductGridItemWidget(_productinfo[index]);
              });
        });
  }

  // Widget _buildProductList() {
  //   return SizedBox(
  //     height: 224.v,
  //     width: 315.h,
  //     child: Stack(
  //       alignment: Alignment.bottomCenter,
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.only(right: 165.h),
  //           child: _buildBrandColumn(
  //             brandImage: noImage,
  //             imageTwentySix: noImage,
  //           ),
  //         ),
  //         Align(
  //           alignment: Alignment.bottomCenter,
  //           child: Container(
  //             margin: EdgeInsets.fromLTRB(98.h, 106.h, 98.h, 78.h),
  //             padding: EdgeInsets.symmetric(
  //               horizontal: 20.h,
  //               vertical: 8.v,
  //             ),
  //             decoration: AppDecoration.OutlinedBlack.copyWith(
  //                 borderRadius: BorderRadiusStyle.roundedBorder20),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Container(
  //                   height: 22.adaptSize,
  //                   width: 22.adaptSize,
  //                   margin: EdgeInsets.only(
  //                     bottom: 1.v,
  //                   ),
  //                   child: Stack(
  //                     alignment: Alignment.topRight,
  //                     children: [
  //                       CustomImageView(
  //                         imagePath: Constants.imagePath,
  //                         height: 20.adaptSize,
  //                         width: 20.adaptSize,
  //                         alignment: Alignment.bottomLeft,
  //                       ),
  //                       Align(
  //                         alignment: Alignment.topRight,
  //                         child: Container(
  //                           height: 8.adaptSize,
  //                           width: 8.adaptSize,
  //                           decoration: BoxDecoration(
  //                               color: appTheme.redA200,
  //                               borderRadius: BorderRadius.circular(4.h),
  //                               boxShadow: [
  //                                 BoxShadow(
  //                                     color: appTheme.black90019,
  //                                     spreadRadius: 2.h,
  //                                     blurRadius: 2.h,
  //                                     offset: Offset(-1, 2))
  //                               ]),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.only(left: 14.h, top: 2.v, bottom: 3.v),
  //                   child: Text(
  //                     Constants.filter.toUpperCase(),
  //                     style: CustomTextStyles.titleSmallSecondaryContainer,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         Align(
  //           alignment: Alignment.bottomLeft,
  //           child: Padding(
  //             padding: EdgeInsets.only(right: 165.h),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   Constants.productNamemsg,
  //                   style: theme.textTheme.bodySmall,
  //                 ),
  //                 SizedBox(
  //                   height: 10.v,
  //                 ),
  //                 Padding(
  //                     padding: EdgeInsets.only(
  //                       right: 40.h,
  //                     ),
  //                     child: _buildSignalRow(
  //                       ratingText: '4.5',
  //                       reviewText: '1045 Reviews',
  //                     )),
  //                 SizedBox(
  //                   height: 150.h,
  //                   child: Text(
  //                     '\$235,00',
  //                     maxLines: null,
  //                     overflow: TextOverflow.ellipsis,
  //                     style: theme.textTheme.titleSmall!.copyWith(height: 1.71),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         Align(
  //           alignment: Alignment.centerRight,
  //           child: Padding(
  //             padding: EdgeInsets.only(left: 165.h),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 _buildBrandColumn(
  //                     brandImage: productgridList[0].brandImage!,
  //                     imageTwentySix: productgridList[0].productImage!),
  //                 SizedBox(
  //                   height: 11.v,
  //                 ),
  //                 Text(
  //                   productgridList[0].productName!,
  //                   style: theme.textTheme.bodySmall,
  //                 ),
  //                 SizedBox(
  //                   height: 10.v,
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.only(right: 40.h),
  //                   child: _buildSignalRow(
  //                       ratingText: productgridList[0].rating!,
  //                       reviewText: productgridList[0].reviewCount!),
  //                 ),
  //                 SizedBox(
  //                   width: 150.h,
  //                   child: Text(
  //                     productgridList[0].price!,
  //                     maxLines: null,
  //                     overflow: TextOverflow.ellipsis,
  //                     style: theme.textTheme.titleSmall!.copyWith(height: 1.71),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildBrandColumn({
  //   required String brandImage,
  //   required String imageTwentySix,
  // }) {
  //   return Container(
  //     padding: EdgeInsets.all(15.h),
  //     decoration: AppDecoration.fillBlack.copyWith(
  //       borderRadius: BorderRadiusStyle.roundedBorder20,
  //     ),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         CustomImageView(
  //           imagePath: brandImage,
  //           height: 24.adaptSize,
  //           width: 24.adaptSize,
  //         ),
  //         SizedBox(
  //           height: 4.v,
  //         ),
  //         CustomImageView(
  //           imagePath: imageTwentySix,
  //           height: 85.v,
  //           width: 120.h,
  //         ),
  //         SizedBox(
  //           height: 7.v,
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildSignalRow(
  //     {required String ratingText, required String reviewText}) {
  //   return Row(
  //     children: [
  //       CustomImageView(
  //         imagePath: noImage,
  //         // height: 12.adaptSize,
  //         // width: 12.adaptSize,
  //         height: 6.adaptSize,
  //         width: 6.adaptSize,
  //       ),
  //       Padding(
  //         padding: EdgeInsets.only(left: 5.h),
  //         child: Text(
  //           ratingText,
  //           style:
  //               theme.textTheme.labelMedium!.copyWith(color: appTheme.black900),
  //         ),
  //       ),
  //       Padding(
  //         padding: EdgeInsets.only(left: 5.h),
  //         child: Text(reviewText,
  //             style: CustomTextStyles.bodySmallGray40011
  //                 .copyWith(color: appTheme.gray400)),
  //       ),
  //     ],
  //   );
  // }
}
