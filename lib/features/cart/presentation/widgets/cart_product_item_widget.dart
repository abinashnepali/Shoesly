import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesly/crore/presentation/resources/app_decoration.dart';
import 'package:shoesly/crore/presentation/resources/custom_text_style.dart';
import 'package:shoesly/crore/presentation/resources/theme_helpers.dart';
import 'package:shoesly/crore/presentation/widgets/custom_icon_button.dart';
import 'package:shoesly/crore/presentation/widgets/custom_image_view.dart';
import 'package:shoesly/crore/utils/size_utils.dart';
import 'package:shoesly/features/cart/data/models/product_details_cart_model.dart';
import 'package:shoesly/features/cart/presentation/controller/cart_item_controller.dart';

class CartProductItemWidget extends StatelessWidget {
  CartProductItemWidget(
      {super.key, required this.cartItem, required this.index});

  final ProductDetailsCartModel cartItem;
  final int index;

  final CartItemController cartController = Get.put(CartItemController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 88.adaptSize,
          width: 88.adaptSize,
          padding: EdgeInsets.symmetric(
            horizontal: 8.h,
            vertical: 19.v,
          ),
          decoration: AppDecoration.fillgrey.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder20,
          ),
          child: CustomImageView(
            imagePath: cartItem.productImage,
            height: 49.v,
            width: 70.h,
            alignment: Alignment.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartItem.productName!,
                style: CustomTextStyles.titleSmallBlack90001,
              ),
              SizedBox(
                height: 10.v,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    cartItem.shoeColor!,
                    style: CustomTextStyles.bodySmallGray700,
                  ),
                  SizedBox(
                    width: 8.v,
                  ),
                  Text(
                    cartItem.brandName!,
                    style: CustomTextStyles.bodySmallGray700,
                  ),
                  SizedBox(
                    width: 8.v,
                  ),
                  Text(cartItem.size!.toString()),
                ],
              ),
              SizedBox(
                height: 12.v,
              ),
              SizedBox(
                width: 212.h,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.v),
                      child: Text(
                        cartItem.price!,
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ClipOval(
                            child: SizedBox(
                              height: 30,
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: CustomIconButton(
                                    alignment: Alignment.topCenter,
                                    icon: Icons.remove_circle_outline,
                                    color:
                                        const Color.fromARGB(255, 14, 13, 13),
                                    iconSize: 24,
                                    onPressed: () {
                                      // _buttonSheetCrl.addRemoveQuanity(remove: true);
                                      cartController.addRemoveItemOnCart(
                                          removeItem: true, index: index);
                                    },
                                  )),
                            ),
                          ),
                          // Addd

                          const SizedBox(
                            width: 2,
                          ),

                          SizedBox(
                            width: 20,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Obx(() => Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      cartItem.numberOfQuantity.toString(),
                                      style:
                                          CustomTextStyles.titleSmallBlack90001,
                                      overflow: TextOverflow.fade,
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),

                          ClipOval(
                            child: SizedBox(
                              height: 30,
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: CustomIconButton(
                                    alignment: Alignment.topCenter,
                                    icon: Icons.add_circle_outline,
                                    color: const Color(0xFF101010),
                                    iconSize: 24,
                                    onPressed: () {
                                      // _buttonSheetCrl.addRemoveQuanity(add: true);
                                      cartController.addRemoveItemOnCart(
                                          addItem: true, index: index);
                                    },
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
