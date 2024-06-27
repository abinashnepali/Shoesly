import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesly/core/presentation/resources/custom_text_style.dart';
import 'package:shoesly/core/presentation/resources/theme_helpers.dart';
import 'package:shoesly/core/presentation/widgets/appbar/custom_appbar.dart';
import 'package:shoesly/core/presentation/widgets/custom_icon_button.dart';
import 'package:shoesly/core/utils/size_utils.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: _appBarSection(),
          body: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 31.v,
                ),
                Expanded(
                  child: SingleChildScrollView(
                      child: Container(
                    margin: EdgeInsets.only(bottom: 5.v),
                    padding: const EdgeInsets.only(left: 30, right: 16),
                    child: Column(
                      children: [
                        _buildPaymentSection(),
                        SizedBox(
                          height: 27.v,
                        ),
                        _buildLocationSection(),
                        SizedBox(
                          height: 30.v,
                        ),

                        /// Order Details
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Order Detail',
                            style: CustomTextStyles
                                .titleMediumOnPrimaryContainerBold,
                          ),
                        ),
                        SizedBox(
                          height: 27.v,
                        ),
                        SizedBox(
                          height: 250,
                          child: ListView.builder(
                              itemCount: 3,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  _buildOrderDetailsSection()),
                        ),
                        // end of orderDetails
                        // start of paymentDetails
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Payment Detail',
                            style: CustomTextStyles
                                .titleMediumOnPrimaryContainerBold,
                          ),
                        ),
                        SizedBox(
                          height: 27.v,
                        ),
                        _buildPaymentDetailsSection()
                      ],
                    ),
                  )),
                )
              ],
            ),
          )),
    );
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
          'Order Summary',
        ),
      ),
      titleTextStyle: CustomTextStyles.titleMediumBlack9001,
      centerTitle: true,
    );
  }

  Widget _buildPaymentSection() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Information',
            style: CustomTextStyles.titleMediumOnPrimaryContainerBold,
          ),
        ),
        SizedBox(
          height: 27.v,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Method',
                  style: CustomTextStyles.titleSmallPrimaryContainer,
                ),
                SizedBox(
                  height: 10.v,
                ),
                Text(
                  'Credit Card',
                  style: theme.textTheme.bodyMedium,
                )
              ],
            ),
            CustomIconButton(
              icon: Icons.arrow_forward_ios_sharp,
              color: appTheme.gray600,
              onPressed: () {},
              iconSize: 14,
            )
          ],
        ),
        SizedBox(
          height: 18.v,
        ),
        Divider(
          color: appTheme.gray200,
        ),
      ],
    );
  }

  Widget _buildLocationSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: CustomTextStyles.titleSmallPrimaryContainer,
                ),
                SizedBox(
                  height: 10.v,
                ),
                Text(
                  'Semarang, Indonesia',
                  style: theme.textTheme.bodyMedium,
                )
              ],
            ),
            CustomIconButton(
              icon: Icons.arrow_forward_ios_sharp,
              color: appTheme.gray600,
              onPressed: () {},
              iconSize: 14,
            )
          ],
        ),
        SizedBox(
          height: 18.v,
        ),
      ],
    );
  }

  Widget _buildOrderDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Jordan 1 Retro High Tie Dye',
            style: theme.textTheme
                .titleMedium //CustomTextStyles.titleSmallPrimaryContainer,
            ),
        SizedBox(
          height: 10.v,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 1.v),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildProductRow(title: 'Nike .'),
                    _buildProductRow(title: 'Red Grey .'),
                    _buildProductRow(title: '40 .'),
                    _buildProductRow(title: 'Qty 1')
                  ],
                )),
            Text(
              '\$235.00',
              style: theme.textTheme.titleSmall!
                  .copyWith(color: appTheme.black900),
            )
          ],
        ),
        SizedBox(
          height: 20.v,
        ),
      ],
    );
  }

  Widget _buildProductRow({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Text(
        title,
        style: theme.textTheme.bodyMedium!.copyWith(color: appTheme.gray700),
      ),
    );
  }

  Widget _buildPaymentDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRowOFPaymentDetails(title: 'Sub Total', price: '705.00'),
        SizedBox(
          height: 27.v,
        ),
        _buildRowOFPaymentDetails(title: 'Shipping', price: '20.00'),
        SizedBox(
          height: 34.v,
        ),
        _buildRowOFPaymentDetails(
            title: 'Total Order',
            price: '725.00',
            style:
                theme.textTheme.titleLarge!.copyWith(color: appTheme.black900)),
      ],
    );
  }

  Widget _buildRowOFPaymentDetails(
      {required String title, required String price, TextStyle? style}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title',
          style: theme.textTheme.titleMedium!.copyWith(color: appTheme.gray600),
        ),
        Text('\$$price',
            style: style ??
                theme.textTheme.titleMedium!
                    .copyWith(color: appTheme.black900)),
      ],
    );
  }
}
