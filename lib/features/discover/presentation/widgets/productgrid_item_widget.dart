import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoesly/core/presentation/resources/app_decoration.dart';
import 'package:shoesly/core/presentation/resources/theme_helpers.dart';
import 'package:shoesly/core/presentation/routes/app_routes.dart';
import 'package:shoesly/core/presentation/widgets/custom_image_view.dart';
import 'package:shoesly/core/utils/size_utils.dart';
import 'package:shoesly/features/discover/data/models/product_details_model.dart';

class ProductGridItemWidget extends StatelessWidget {
  ProductGridItemWidget(this.productinfo, {super.key});

  ProductDetailsModel productinfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 300, // Adjust the max height as needed
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (productinfo != null) {
                Get.toNamed(Routes.productDetails, arguments: productinfo);
                //Get.toNamed(Routes.cartScreen);
              } else {}
            },
            child: Container(
              padding: EdgeInsets.all(15.h),
              decoration: AppDecoration.fillgrey.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: Column(
                children: [
                  CustomImageView(
                    imagePath: productinfo.brandImage!,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    alignment: Alignment.topLeft,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 4.v,
                  ),
                  CustomImageView(
                    imagePath: productinfo.productImage!,
                    height: 85.v,
                    width: 120.h,
                  ),
                  SizedBox(
                    height: 7.v,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 14.v,
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productinfo.productName!,
                  style: theme.textTheme.bodySmall,
                ),
                SizedBox(
                  height: 6.v,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 33.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xFFFCD240),
                            size: 12,
                          ),
                          Text(
                            "${productinfo.rating!}",
                            style: theme.textTheme.labelMedium,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.h),
                      child: Text(
                        productinfo.reviewCount!,
                        //style: CustomTextStyles,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 3.v,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '\$${productinfo.price!}',
                    style: theme.textTheme.titleSmall,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
