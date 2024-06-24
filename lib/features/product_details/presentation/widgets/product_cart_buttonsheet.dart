import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesly/core/presentation/resources/app_decoration.dart';
import 'package:shoesly/core/presentation/resources/custom_text_style.dart';
import 'package:shoesly/core/presentation/resources/theme_helpers.dart';
import 'package:shoesly/core/presentation/routes/app_routes.dart';
import 'package:shoesly/core/presentation/widgets/custom_elevated_button.dart';
import 'package:shoesly/core/presentation/widgets/custom_icon_button.dart';
import 'package:shoesly/core/presentation/widgets/custom_outline_button.dart';
import 'package:shoesly/core/utils/size_utils.dart';

class ProductCartBottomSheet extends StatelessWidget {
  const ProductCartBottomSheet({super.key, required this.itemNO});

  final String? itemNO;

  @override
  Widget build(BuildContext context) {
    String quanity = itemNO!;
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(30.h),
      decoration: AppDecoration.fillSecondaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 8.v,
          ),
          ClipOval(
            child: Container(
              height: 80.adaptSize,
              width: 80.adaptSize,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: Stack(alignment: Alignment.center, children: [
                Align(
                    alignment: Alignment.center,
                    child: CustomIconButton(
                      alignment: Alignment.topCenter,
                      icon: Icons.check,
                      color: Color(0xFF101010),
                      iconSize: 40,
                      onPressed: () {},
                    )),
              ]),
            ),
          ),
          SizedBox(
            height: 29.v,
          ),
          Text(
            'Added to Cart',
            style: theme.textTheme.headlineMedium,
          ),
          SizedBox(
            height: 11.v,
          ),
          Text('${quanity} Item Total'),
          SizedBox(
            height: 23.v,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomOutlineButton(
                  text: 'Back to Explore'.toUpperCase(),
                  margin: EdgeInsets.only(right: 7.h),
                  buttonTextStyle:
                      CustomTextStyles.titleMediumOnPrimaryContainer,
                  onPressed: () {
                    Get.close(1);
                    Get.toNamed(Routes.homeTabContainer);
                  },
                ),
              ),
              Expanded(
                child: CustomElevatedButton(
                    text: 'To Cart'.toUpperCase(),
                    margin: EdgeInsets.only(left: 7.h),
                    buttonTextStyle: TextStyle(
                        color: appTheme.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                    onPressed: () {
                      Get.close(1);
                      Get.toNamed(Routes.cartScreen);
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
