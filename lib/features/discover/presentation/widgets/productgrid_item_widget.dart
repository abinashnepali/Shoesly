import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shoesly/crore/presentation/resources/app_decoration.dart';
import 'package:shoesly/crore/presentation/resources/theme_helpers.dart';
import 'package:shoesly/crore/presentation/widgets/custom_image_view.dart';
import 'package:shoesly/crore/utils/size_utils.dart';
import 'package:shoesly/features/discover/data/models/productgrid_item_model.dart';

class ProductGridItemWidget extends StatelessWidget {
  ProductGridItemWidget(this.productinfo, {super.key});

  ProductgirdItemModel productinfo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15.h),
          decoration: AppDecoration.fillgrey.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder20,
          ),
          child: Column(
            children: [
              CustomImageView(
                imagePath: productinfo.brandImage!,
                height: 14.adaptSize,
                width: 14.adaptSize,
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
        SizedBox(
          height: 14.v,
        ),
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
                  // CustomImageView(
                  //   imagePath: productinfo.brandImage,
                  //   height: 12.adaptSize,
                  //   width: 12.adaptSize,
                  //   margin: EdgeInsets.only(bottom: 1.v),
                  // ),
                  Icon(
                    Icons.star,
                    color: Color(0xFFFCD240),
                    size: 12,
                  ),
                  Text(
                    productinfo.rating!,
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
        Text(
          productinfo.price!,
          style: theme.textTheme.titleSmall,
        )
      ],
    );
  }
}
