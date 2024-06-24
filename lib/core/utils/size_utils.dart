import 'package:flutter/material.dart';

// It is used to create UI Resposive.

const num DESIGN_WIDTH = 375;
const num DESIGN_HEIGHT = 812;
const num DESIGN_DESIGN_STATUS_BAR = 0;

extension ResponsiveExtension on num {
  double get _width => SizeUtils.width;
  double get _height => SizeUtils.height;
  double get h => ((this * _width) / DESIGN_WIDTH);
  double get v => (this * _height) / (DESIGN_HEIGHT - DESIGN_DESIGN_STATUS_BAR);
  double get adaptSize {
    var height = v;
    var width = h;
    return height < width ? height.toDoubleVlaue() : width.toDoubleVlaue();
  }

  double get fSize => adaptSize;
}

extension FormatExtension on double {
  double toDoubleVlaue({int fractionDigits = 2}) {
    return double.parse(this.toStringAsFixed(fractionDigits));
  }

  double isNonZero({num defaultValue = 0.0}) {
    return this > 0 ? this : defaultValue.toDouble();
  }
}

enum DeviceType { mobile, tablet, desktop }

typedef ResponsiveBuild = Widget Function(
    BuildContext context, Orientation orientation, DeviceType deviceType);

class Sizer extends StatelessWidget {
  const Sizer({Key? key, required this.builder}) : super(key: key);

  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return OrientationBuilder(builder: ((context, orientation) {
        SizeUtils.setScrenSize(constrains, orientation);
        return builder(context, orientation, SizeUtils.deviceType);
      }));
    });
  }
}

class SizeUtils {
  //Device's BoxConstraints
  static late BoxConstraints boxConstraints;
// Device's Orientation
  static late Orientation orientation;
//
  static late DeviceType deviceType;
// device width
  static late double height;
  // device Height
  static late double width;

  static void setScrenSize(
    BoxConstraints constraints,
    Orientation currentOrinetation,
  ) {
    boxConstraints = constraints;
    orientation = currentOrinetation;
    if (orientation == Orientation.portrait) {
      width = boxConstraints.maxWidth.isNonZero(defaultValue: DESIGN_WIDTH);
      height = boxConstraints.maxHeight.isNonZero();
    } else {
      width = boxConstraints.maxHeight.isNonZero(defaultValue: DESIGN_WIDTH);
      height = boxConstraints.maxWidth.isNonZero();
    }
    deviceType = DeviceType.mobile;
  }
}
