import 'package:flutter/cupertino.dart';
import 'package:shoesly/crore/presentation/resources/theme_helpers.dart';
import 'package:shoesly/crore/utils/size_utils.dart';

class AppDecoration {
  static BoxDecoration get fillBlack => BoxDecoration(color: appTheme.black900);
  static BoxDecoration get fillgrey => BoxDecoration(color: appTheme.gray400);

  static BoxDecoration get fillRedA => BoxDecoration(color: appTheme.redA200);
  static BoxDecoration get fillSecondaryContainer =>
      BoxDecoration(color: theme.colorScheme.secondaryContainer);

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
