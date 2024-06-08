import 'package:flutter/material.dart';
import 'package:shoesly/crore/presentation/resources/theme_helpers.dart';
import 'package:shoesly/crore/utils/size_utils.dart';
import 'package:shoesly/features/product_details/data/models/sizeselection_item_model.dart';

class SizeselectionItemWidget extends StatelessWidget {
  SizeselectionItemWidget({super.key, this.sizeinfo});

  SizeSelectionItemModel? sizeinfo;
  // final isToggled = useState(false);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(),
        child: RawChip(
          padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 11.v),
          showCheckmark: false,
          labelPadding: EdgeInsets.zero,
          label: Text(
            sizeinfo!.size.toString(),
            style: TextStyle(
                color: (sizeinfo?.isSizeSelected ?? false)
                    ? theme.colorScheme.secondaryContainer
                    : appTheme.gray600,
                fontSize: 12.fSize,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w400),
          ),
          selected: (sizeinfo?.isSizeSelected ?? false),
          backgroundColor: Colors.transparent,
          selectedColor: appTheme.black900,
          shape: const CircleBorder(
            side: BorderSide.none,
          ),
          onSelected: (value) {
            sizeinfo!.isSizeSelected = value;
            //isToggled.value = !isToggled.value;
          },
        ));
  }
}
