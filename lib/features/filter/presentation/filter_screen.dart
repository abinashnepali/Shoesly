import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesly/crore/presentation/resources/custom_text_style.dart';
import 'package:shoesly/crore/presentation/resources/theme_helpers.dart';
import 'package:shoesly/crore/presentation/widgets/appbar/custom_appbar.dart';
import 'package:shoesly/crore/presentation/widgets/custom_icon_button.dart';
import 'package:shoesly/crore/utils/size_utils.dart';
import 'package:shoesly/features/filter/data/models/brand_model.dart';
import 'package:shoesly/features/filter/data/models/range_model.dart';
import 'package:shoesly/features/filter/presentation/controller/filter_controller.dart';
import 'package:shoesly/features/filter/presentation/widgets/brand_list_item_widget.dart';
import 'package:shoesly/features/filter/presentation/widgets/sort_Item_widget.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});
  double _value = 20, _startValue = 20, _endValue = 80;

  final FilterController filterController = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: _buildAppBar(),
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(
                    height: 23.v,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _brandSectionWidget(),
                      SizedBox(
                        height: 35.v,
                      ),
                      SizedBox(
                        height: 39.v,
                      ),
                      _priceRangeSectionWidget(),
                      SizedBox(
                        height: 39.v,
                      ),
                      _buildSortBySectionWidget()
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }

  PreferredSizeWidget _buildAppBar() {
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
          'Filter',
        ),
      ),
      titleTextStyle: CustomTextStyles.titleMediumBlack9001,
      centerTitle: true,
    );
  }

  Widget _brandSectionWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Brands',
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(
            height: 23.v,
          ),
          Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: Row(
              children: [
                Expanded(
                    child: SizedBox(
                  height: 97.v,
                  child: ListView.separated(
                    itemCount: branditemList.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(
                      width: 20.h,
                    ),
                    itemBuilder: (context, index) =>
                        BrandListItemWidget(brandItem: branditemList[index]),
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _priceRangeSectionWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price Range',
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(
            height: 28.v,
          ),
          Stack(children: [
            SizedBox(
                width: double.maxFinite,
                child: Obx(() => RangeSlider(
                      min: 0.0,
                      max: 1750.0,
                      divisions: 4,
                      activeColor: appTheme.black90001,
                      inactiveColor: appTheme.gray200,
                      values: RangeValues(
                          filterController.sliderValues.value.start,
                          filterController.sliderValues.value.end),
                      onChanged: (values) {
                        filterController.updateSliderValues(
                            CustomRangeValues(values.start, values.end));
                      },
                    ))),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$0',
                    style: CustomTextStyles.titleSmallBlack90001,
                  ),
                  const SizedBox(width: 60),
                  Text(
                    '\$200',
                    style: CustomTextStyles.titleSmallBlack90001,
                  ),
                  const SizedBox(width: 100),
                  Text(
                    '\$750',
                    style: CustomTextStyles.titleSmallBlack90001,
                  ),
                  const SizedBox(width: 30),
                  Text(
                    '\$1750',
                    style: CustomTextStyles.titleSmallBlack90001,
                  ),
                ],
              ),
            ),
          ])
        ],
      ),
    );
  }

  Widget _buildSortBySectionWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sort By',
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(
            height: 28.v,
          ),
          // Wrap(
          //   direction: Axis.horizontal,
          //   runSpacing: 10.v,
          //   spacing: 10.h,
          //   children: List.generate(
          //       sortItemsList.length,
          //       (index) => SizedBox(
          //             child: SortItemWidget(
          //               sortItem: sortItemsList[index],
          //             ),
          //           )),
          // )

          SizedBox(
            height: 50.v,
            width: double.maxFinite,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(
                width: 10.v,
              ),
              itemCount: sortItemsList.length,
              itemBuilder: (context, index) => SortItemWidget(
                sortItem: sortItemsList[index],
                index: index,
              ),
            ),
          )
        ],
      ),
    );
  }
}
