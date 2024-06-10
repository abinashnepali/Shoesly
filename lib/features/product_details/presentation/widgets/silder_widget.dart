import 'package:flutter/material.dart';

import 'package:shoesly/crore/presentation/resources/app_decoration.dart';
import 'package:shoesly/crore/presentation/resources/theme_helpers.dart';
import 'package:shoesly/crore/presentation/widgets/custom_image_view.dart';
import 'package:shoesly/crore/utils/constants.dart';
import 'package:shoesly/crore/utils/size_utils.dart';

class SliderWidget extends StatelessWidget {
  SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> shoeColor = [
      Color(0xFFE7E7E7),
      Colors.black,
      Colors.green,
      Colors.blue
    ];
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(10.h),
        decoration: AppDecoration.fillgrey.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 59.v,
            ),
            CustomImageView(
              imagePath: '${Constants.productImage}/Product.png',
              height: 174.v,
              width: 252.h,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 17.v,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 40.v,
                width: 132.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 11.h,
                  vertical: 10.v,
                ),
                decoration: AppDecoration.OutlinedBlack90019.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(shoeColor.length, (index) {
                    return ClipOval(
                      child: SizedBox(
                        height: 18.v,
                        width: 20.h,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: shoeColor[index],
                            ),
                            child: index == 2
                                ? Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.check_rounded,
                                      color: appTheme.white,
                                      size: 12,
                                    ),
                                  )
                                : SizedBox()),
                      ),
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
