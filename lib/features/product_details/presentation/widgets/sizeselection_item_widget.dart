import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesly/core/presentation/resources/theme_helpers.dart';
import 'package:shoesly/core/utils/size_utils.dart';
import 'package:shoesly/features/product_details/data/models/sizeselection_item_model.dart';
import 'package:shoesly/features/product_details/presentation/controller/product_detail_controller.dart';

class SizeselectionItemWidget extends StatelessWidget {
  SizeselectionItemWidget({super.key, this.sizeinfo, required this.index});

  SizeSelectionItemModel? sizeinfo;
  int index;
  final _productDetailsCtr = Get.find<ProductDetailController>();

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(),
        child: Obx(
          () => RawChip(
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 11.v),
            showCheckmark: false,
            labelPadding: EdgeInsets.zero,
            label: Text(
              sizeinfo!.size.toString(),
              style: TextStyle(
                  color: (sizeinfo?.isSizeSelected?.value ?? false)
                      ? theme.colorScheme.secondaryContainer
                      : appTheme.gray600,
                  fontSize: 12.fSize,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w400),
            ),
            selected: (sizeinfo?.isSizeSelected?.value ?? false),
            backgroundColor: Colors.transparent,
            selectedColor: appTheme.black900,
            shape: const CircleBorder(
              side: BorderSide.none,
            ),
            onSelected: (value) {
              _productDetailsCtr.updateSizeSelected(index: index);
            },
          ),
        ));
  }
}
