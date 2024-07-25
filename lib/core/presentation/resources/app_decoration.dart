import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/core/presentation/resources/theme_helpers.dart';
import 'package:shoesly/core/utils/size_utils.dart';

class AppDecoration {
  static BoxDecoration get fillBlack => BoxDecoration(color: appTheme.black900);
  static BoxDecoration get fillgrey600 =>
      BoxDecoration(color: appTheme.gray600);

  static BoxDecoration get fillgrey => BoxDecoration(color: appTheme.gray200);

  static BoxDecoration get fillRedA => BoxDecoration(color: appTheme.redA200);
  static BoxDecoration get fillSecondaryContainer =>
      BoxDecoration(color: theme.colorScheme.secondaryContainer);

  static BoxDecoration get blueGray10033 => BoxDecoration(
        color: appTheme.blueGray10033,
      );

//outline decorations
  static BoxDecoration get OutlinedBlack =>
      BoxDecoration(color: appTheme.black900, boxShadow: [
        BoxShadow(
            color: appTheme.black90019.withOpacity(0.15),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              5,
            ))
      ]);

  static BoxDecoration get OutlinedBlack90019 =>
      BoxDecoration(color: theme.colorScheme.secondaryContainer, boxShadow: [
        BoxShadow(
            color: appTheme.black90019,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              0,
            ))
      ]);

  static BoxDecoration get OutlinedBlueGray =>
      BoxDecoration(color: theme.colorScheme.secondaryContainer, boxShadow: [
        BoxShadow(
            color: appTheme.blueGray10033,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              -20,
            ))
      ]);
}

class BorderRadiusStyle {
  //custome boders
  static BorderRadius get customBorderTL20 => BorderRadius.vertical(
        top: Radius.circular(20.h),
      );

  static BorderRadius get customBorderTL201 => BorderRadius.horizontal(
        left: Radius.circular(20.h),
      );
  //Rounded borders

  static BorderRadius get roundedBorder20 => BorderRadius.circular(20.h);
}
