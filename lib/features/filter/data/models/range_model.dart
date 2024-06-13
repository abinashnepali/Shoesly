import 'package:flutter/material.dart';

import 'package:shoesly/crore/presentation/resources/theme_helpers.dart';

class CustomRangeValues {
  final double start;
  final double end;

  CustomRangeValues(this.start, this.end);

  @override
  String toString() {
    return 'RangeValues(start: $start, end: $end)';
  }
}

class ColorFilterModel {
  ColorFilterModel({required this.itemColor, required this.name});

  Color? itemColor;
  String? name;
}

List<String> sortItemsList = ['Most recent', 'lowest price', 'Highest Price'];
List<String> genderinfoList = ['Man', 'Woman', 'Unisex'];
List<ColorFilterModel> colorFilterinfo = [
  ColorFilterModel(name: 'Black', itemColor: appTheme.black90001),
  ColorFilterModel(name: 'White', itemColor: appTheme.white),
  ColorFilterModel(name: 'Red', itemColor: appTheme.redA200),
];
