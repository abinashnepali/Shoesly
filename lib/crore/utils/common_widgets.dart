import 'package:flutter/material.dart';

import 'package:shoesly/crore/presentation/resources/app_decoration.dart';
import 'package:shoesly/crore/presentation/resources/custom_text_style.dart';
import 'package:shoesly/crore/presentation/widgets/custom_elevated_button.dart';
import 'package:shoesly/crore/utils/size_utils.dart';

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
      margin: margin ?? EdgeInsets.only(left: 30.h, right: 30.h, bottom: 19.v),
      decoration: AppDecoration.OutlinedBlueGray,
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
    );
  }
}
