import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesly/core/presentation/resources/theme_helpers.dart';
import 'package:shoesly/core/utils/size_utils.dart';
import 'package:shoesly/features/filter/data/models/range_model.dart';

import 'package:shoesly/features/filter/presentation/controller/filter_controller.dart';

class ColorSectionWidget extends StatelessWidget {
  ColorSectionWidget({super.key, required this.sortItem, required this.index});

  final ColorFilterModel sortItem;
  final int index;

  final FilterController _filterController = Get.find<FilterController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Theme(
          data: ThemeData(canvasColor: Colors.transparent),
          child: SizedBox(
            child: RawChip(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
              showCheckmark: false,
              labelPadding: EdgeInsets.only(left: 10),
              avatar: ClipOval(
                  child: Container(
                      decoration: BoxDecoration(
                        color: sortItem.itemColor,
                      ),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                      ))),
              label: Text(
                sortItem.name!,
                style: TextStyle(
                    color: appTheme.black900,
                    fontSize: 16.fSize,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600),
              ),
              selected:
                  (_filterController.colorFilterIsselectedList[index] ?? false),
              backgroundColor: Colors.transparent,
              selectedColor: Colors.transparent,
              shape: (_filterController.colorFilterIsselectedList[index])
                  ? RoundedRectangleBorder(
                      side: BorderSide(
                          color: appTheme.black900,
                          width: 1.h,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20.h))
                  : RoundedRectangleBorder(
                      side: BorderSide(
                          color: theme.colorScheme.primary, width: 1.h),
                      borderRadius: BorderRadius.circular(20.h)),
              onSelected: (value) {
                _filterController.updateColorSelection(index: index);
              },
            ),
          )),
    );
  }
}
