import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoesly/core/presentation/resources/custom_text_style.dart';
import 'package:shoesly/core/presentation/resources/theme_helpers.dart';
import 'package:shoesly/core/presentation/widgets/appbar/custom_appbar.dart';
import 'package:shoesly/core/presentation/widgets/custom_icon_button.dart';
import 'package:shoesly/core/utils/common_widgets.dart';
import 'package:shoesly/core/utils/size_utils.dart';
import 'package:shoesly/features/cart/presentation/controller/cart_item_controller.dart';
import 'package:shoesly/features/cart/presentation/controller/local_cart_controller.dart';
import 'package:shoesly/features/cart/presentation/widgets/cart_product_item_widget.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final _localCartContoller = Get.find<LocalCartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<LocalCartController>(
            init: LocalCartController(),
            builder: (context) {
              return Scaffold(
                appBar: _appBarSection(),
                body: SingleChildScrollView(
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 30.v),
                    child: Column(
                      children: [_buildProductList()],
                    ),
                  ),
                ),
                bottomNavigationBar: _localCartContoller.cartItemList.isNotEmpty
                    ? _buildBottonNavigation()
                    : const SizedBox.shrink(),
              );
            }));
  }

  PreferredSizeWidget _appBarSection() {
    return CustomeAppBar(
      height: 80.v,
      leadingWidth: 54.h,
      leading: CustomIconButton(
        icon: Icons.arrow_back_rounded,
        onPressed: () => Get.back(),
      ),
      title: const Padding(
        padding: EdgeInsets.zero,
        child: Text(
          'Cart',
        ),
      ),
      titleTextStyle: CustomTextStyles.titleMediumBlack9001,
      centerTitle: true,
    );
  }

  Widget _buildBottonNavigation() {
    return GetBuilder<LocalCartController>(
        init: Get.find<LocalCartController>(),
        builder: (context) {
          final grandTotal = Get.find<LocalCartController>().grandTotalPrice;
          return CommonWidget.bottomPriceAndCart(
              buttonLabel: 'Check Out',
              labelText: 'Grand Total',
              price: '\$ $grandTotal',
              onPressed: () {
                Get.find<CartItemController>().addToCartOnFirebase();
              });
        });
  }

  Widget _buildProductList() {
    final cartItems = _localCartContoller.cartItemList;
    return cartItems.isEmpty
        ? const Center(
            child: SizedBox(
              child: Text('No Cart Data'),
            ),
          )
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cartItems.length, //productDetailsCartList.length,
                separatorBuilder: ((context, index) {
                  return SizedBox(
                    height: 30.v,
                  );
                }),
                itemBuilder: ((context, index) {
                  return Dismissible(
                    key: Key(index.toString()),
                    background: slideLeftBackground(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      _localCartContoller.removeCartItem(cartItems[index]);
                    },
                    child: CartProductItemWidget(
                      cartItem: cartItems[index],
                      index: index,
                    ),
                  );
                })),
          );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: double.infinity,
          width: 100,
          decoration: BoxDecoration(
            color: appTheme.redA200,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.delete_outline_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
