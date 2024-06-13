import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoesly/crore/presentation/resources/custom_text_style.dart';
import 'package:shoesly/crore/presentation/resources/theme_helpers.dart';
import 'package:shoesly/crore/presentation/widgets/appbar/custom_appbar.dart';
import 'package:shoesly/crore/presentation/widgets/custom_dialog.dart';
import 'package:shoesly/crore/presentation/widgets/custom_icon_button.dart';
import 'package:shoesly/crore/utils/common_widgets.dart';
import 'package:shoesly/crore/utils/constants.dart';
import 'package:shoesly/crore/utils/size_utils.dart';
import 'package:shoesly/features/cart/data/models/product_details_cart_model.dart';
import 'package:shoesly/features/cart/presentation/widgets/cart_product_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
      bottomNavigationBar: _buildBottonNavigation(),
    ));
  }

  PreferredSizeWidget _appBarSection() {
    return CustomeAppBar(
      height: 80.v,
      leadingWidth: 54.h,
      leading: CustomIconButton(
        icon: Icons.arrow_back_rounded,
        onPressed: () => Get.back(),
      ),
      title: Padding(
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
    return CommonWidget.bottomPriceAndCart(
        buttonLabel: 'Check Out',
        labelText: 'Grand Total',
        price: '\$7005.00',
        onPressed: () {});
  }

  Widget _buildProductList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: productDetailsCartList.length,
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
                const CustomDialog(
                    titleText: Constants.deleteConfirm,
                    buttonOneLabel: 'Back',
                    buttonTwoLabel: 'Yes');
              },
              child: CartProductItemWidget(
                cartItem: productDetailsCartList[index],
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
