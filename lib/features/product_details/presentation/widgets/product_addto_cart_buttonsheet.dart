import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesly/crore/presentation/resources/app_decoration.dart';
import 'package:shoesly/crore/presentation/resources/custom_text_style.dart';
import 'package:shoesly/crore/presentation/resources/theme_helpers.dart';
import 'package:shoesly/crore/presentation/widgets/custom_icon_button.dart';
import 'package:shoesly/crore/presentation/widgets/custom_text_formField.dart';
import 'package:shoesly/crore/utils/common_widgets.dart';
import 'package:shoesly/crore/utils/size_utils.dart';
import 'package:shoesly/features/product_details/presentation/controller/product_addto_cart_buttonsheet_controller.dart';
import 'package:shoesly/features/product_details/presentation/widgets/product_cart_buttonsheet.dart';

class ProductBottomSheet extends StatelessWidget {
  const ProductBottomSheet({super.key});

  void _showCartBottomSheet() {
    Get.back();
    if (Get.isBottomSheetOpen == null || !Get.isBottomSheetOpen!) {
      Get.bottomSheet(
        ProductCartBottomSheet(),
        isScrollControlled: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ProductAddtoCartButtonSheetController _buttonSheetCrl =
        Get.find<ProductAddtoCartButtonSheetController>();

    return Container(
      width: double.infinity,
      //height: 600.v,
      padding: EdgeInsets.symmetric(
        horizontal: 30.h,
        vertical: 10.v,
      ),
      decoration: AppDecoration.fillSecondaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 4.v,
            width: 44.h,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(2.h),
            ),
          ),
          SizedBox(
            height: 28.v,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Add to Cart',
                style: CustomTextStyles.titleLargeBlack900,
              ),
              CustomIconButton(
                  onPressed: () => Get.back(), icon: Icons.close_outlined)
            ],
          ),
          SizedBox(
            height: 38.v,
          ),
          Text(
            'Quantity',
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(
            height: 8.v,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipOval(
                  child: SizedBox(
                    height: 38,
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: CustomIconButton(
                          alignment: Alignment.topCenter,
                          icon: Icons.remove_circle_outline,
                          color: Color.fromARGB(255, 14, 13, 13),
                          iconSize: 28,
                          onPressed: () {
                            _buttonSheetCrl.addRemoveQuanity(remove: true);
                          },
                        )),
                  ),
                ),
                // Addd

                SizedBox(
                  width: 4,
                ),

                ClipOval(
                  child: SizedBox(
                    height: 38,
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: CustomIconButton(
                          alignment: Alignment.topCenter,
                          icon: Icons.add_circle_outline,
                          color: Color(0xFF101010),
                          iconSize: 28,
                          onPressed: () {
                            _buttonSheetCrl.addRemoveQuanity(add: true);
                          },
                        )),
                  ),
                ),
              ],
            ),
          ),
          CustomTextFormField(
            controller: _buttonSheetCrl.quantitycontroller,
            hinText: 'No of Quantity',
            hintTextStyle: CustomTextStyles.bodySmallGray400,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.number,
          ),
          SizedBox(
            height: 32.v,
          ),
          Obx(
            () => CommonWidget.bottomPriceAndCart(
                margin: EdgeInsets.all(0),
                buttonLabel: 'Add to Cart',
                labelText: 'Total Price',
                price: '\$${_buttonSheetCrl.golbalTotalPrice.value}',
                onPressed: () {
                  _showCartBottomSheet();
                }),
          ),
          SizedBox(
            height: 12.v,
          )
        ],
      ),
    );
  }
}
