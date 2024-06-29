import 'package:flutter/material.dart';

import 'package:shoesly/core/presentation/resources/app_decoration.dart';
import 'package:shoesly/core/presentation/resources/custom_text_style.dart';
import 'package:shoesly/core/presentation/widgets/custom_elevated_button.dart';
import 'package:shoesly/core/utils/size_utils.dart';

class CommonWidget {
  static Widget bottomPriceAndCart(
      {required labelText,
      required String price,
      required String buttonLabel,
      required VoidCallback onPressed,
      margin}) {
    return Container(
      height: 90.h,
      width: double.infinity,
      margin: margin ?? EdgeInsets.only(left: 14.h, right: 14.h, bottom: 19.v),
      decoration: AppDecoration.blueGray10033,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  labelText,
                  style: CustomTextStyles.bodySmallGray400,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 11.v),
                  child: Text(
                    price,
                    style: CustomTextStyles.titleLargeBlack900,
                  ),
                )
              ],
            ),
            CustomElevatedButton(
              width: 156.h,
              text: buttonLabel.toUpperCase(),
              buttonTextStyle: CustomTextStyles.labelMediumWhite,
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}
