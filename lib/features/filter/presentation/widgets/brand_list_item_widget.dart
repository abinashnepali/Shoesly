import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoesly/crore/presentation/resources/app_decoration.dart';
import 'package:shoesly/crore/presentation/resources/custom_text_style.dart';
import 'package:shoesly/crore/presentation/resources/theme_helpers.dart';
import 'package:shoesly/crore/presentation/widgets/custom_image_view.dart';
import 'package:shoesly/crore/utils/size_utils.dart';
import 'package:shoesly/features/filter/data/models/brand_model.dart';
import 'package:shoesly/features/filter/presentation/controller/filter_controller.dart';

class BrandListItemWidget extends StatelessWidget {
  BrandListItemWidget(
      {super.key, required this.brandItem, required this.index});

  final FilterController _filterController = Get.find<FilterController>();

  final BrandModel? brandItem;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _filterController.updateBrandSelection(index: index);
        },
        child: Obx(
          () => SizedBox(
            height: 53.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.adaptSize,
                  width: 50.adaptSize,
                  child: Stack(alignment: Alignment.centerRight, children: [
                    SizedBox(
                      height: 38.adaptSize,
                      width: 38.adaptSize,
                      child: CircleAvatar(
                        backgroundColor: appTheme.gray200,
                        radius: 22,
                        child: CustomImageView(
                          imagePath: brandItem?.brandImagePath,
                          height: 20.adaptSize,
                          width: 20.adaptSize,
                          alignment: Alignment.center,
                          color: appTheme.black900,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Visibility(
                        visible: brandItem?.isSelected?.value ?? false,
                        child: ClipOval(
                          child: Container(
                            height: 16.adaptSize,
                            width: 16.adaptSize,
                            decoration: BoxDecoration(
                                color: appTheme.black900,
                                border: Border.all(
                                    width: 1, style: BorderStyle.solid),
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder20),
                            child: Center(
                                child: Icon(
                              Icons.check,
                              size: 12,
                              color: theme.colorScheme.background,
                            )),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 10.v,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    brandItem!.brandName!,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
                SizedBox(
                  height: 2.v,
                ),
                Text(
                  '1001 items',
                  style: CustomTextStyles.bodySmallGray40011,
                )
              ],
            ),
          ),
        ));
  }
}
