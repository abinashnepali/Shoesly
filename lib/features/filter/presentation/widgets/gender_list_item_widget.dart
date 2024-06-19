import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesly/crore/presentation/resources/theme_helpers.dart';
import 'package:shoesly/crore/utils/size_utils.dart';

import 'package:shoesly/features/filter/presentation/controller/filter_controller.dart';

class GenderItemList extends StatelessWidget {
  GenderItemList({super.key, required this.sortItem, required this.index});

  final String? sortItem;
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
              labelPadding: EdgeInsets.zero,
              label: Text(
                sortItem!,
                style: TextStyle(
                    color:
                        (_filterController.genderFilterIsselectedList[index] ??
                                false)
                            ? theme.colorScheme.secondaryContainer
                            : appTheme.black900,
                    fontSize: 16.fSize,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600),
              ),
              selected: (_filterController.genderFilterIsselectedList[index] ??
                  false),
              backgroundColor: Colors.transparent,
              selectedColor: appTheme.black900,
              shape:
                  (_filterController.genderFilterIsselectedList[index] ?? false)
                      ? RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(20.h))
                      : RoundedRectangleBorder(
                          side: BorderSide(
                              color: theme.colorScheme.primary, width: 1.h),
                          borderRadius: BorderRadius.circular(20.h)),
              onSelected: (value) {
                //  _filterController.sortFilterIsselectedList[index] = value;
                _filterController.updateGenderSelection(index: index);
              },
            ),
          )),
    );
  }
}