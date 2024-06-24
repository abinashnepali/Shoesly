import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesly/core/utils/pref_utils.dart';
import 'package:shoesly/core/utils/size_utils.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

class ThemeHelper {
  final _appTheme = null; //= PrefUtils().getThemeData();

  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightcode': LightCodeColors()
  };

  final Map<String, ColorScheme> _supportColorScheme = {
    'lightcode': ColorSchemes.lighCodeColorSchema
  };
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  ThemeData _getThemeData() {
    var colorSchema =
        _supportColorScheme[_appTheme] ?? ColorSchemes.lighCodeColorSchema;

    return ThemeData(
        visualDensity: VisualDensity.standard,
        colorScheme: colorSchema,
        textTheme: TextThemes.textTheme(colorSchema),
        scaffoldBackgroundColor: colorSchema.secondaryContainer,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: appTheme.black900,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              visualDensity: const VisualDensity(
                vertical: -4,
                horizontal: -4,
              ),
              padding: EdgeInsets.zero),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: appTheme.black900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            side: BorderSide(
              color: colorSchema.primary,
              width: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
            padding: EdgeInsets.zero,
          ),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return appTheme.black900;
            }
            return Colors.transparent;
          }),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
        ),
        dividerTheme:
            DividerThemeData(thickness: 1, space: 1, color: appTheme.gray100));
  }

  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

// It returns the lightcode colors for the current time
  LightCodeColors themeColor() => _getThemeColors();

  //return the current theme data
  ThemeData themeData() => _getThemeData();
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyMedium: TextStyle(
          color: appTheme.gray700,
          fontSize: 14.fSize,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w400,
        ), //
        bodySmall: TextStyle(
          color: appTheme.black900,
          fontSize: 12.fSize,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
            color: appTheme.black900,
            fontSize: 30.fSize,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700),
        headlineSmall: TextStyle(
            color: appTheme.black900,
            fontSize: 24.fSize,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w600),
        labelLarge: TextStyle(
            color: appTheme.black900,
            fontSize: 12.fSize,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700),
        labelMedium: TextStyle(
            color: appTheme.black900,
            fontSize: 12.fSize,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700),

        titleLarge: TextStyle(
            color: appTheme.gray400,
            fontSize: 20.fSize,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700),

        titleMedium: TextStyle(
            color: appTheme.black900,
            fontSize: 16.fSize,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w600),

        titleSmall: TextStyle(
            color: appTheme.black900,
            fontSize: 14.fSize,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700),

        //
      );
}

class ColorSchemes {
  static const lighCodeColorSchema = ColorScheme.light(
      primary: Color(0XFFE7E7E7),
      secondaryContainer: Color(0XFFFFFFFF),
      onPrimary: Color(0XFF2952CC),
      onPrimaryContainer: Color(0XFF160700));
}

class LightCodeColors {
  //Amber
  Color get amberA200 => const Color(0XFF0F0F0F);
  // balck
  Color get black900 => const Color(0XFF0F0F0F);
  Color get black90001 => const Color(0XFF070C18);
  Color get black90002 => const Color(0XFF000000);
  Color get black90019 => const Color(0X19000000);

  Color get blueGray10033 => const Color(0X33D7D7D7);
  Color get blueGray400 => const Color(0XFF888888);

//gray
  Color get gray100 => const Color(0XFFF3F3F3);
  Color get gray200 => const Color(0XFFE7E7E7);

  Color get gray400 => const Color(0XFFB7B7B7);
  Color get gray500 => const Color(0XFFAAAAAA);
  Color get gray600 => const Color(0XFF6F6F6F);
  Color get gray700 => const Color(0XFF666666);

  //Red
  Color get redA200 => const Color(0XFFFF4C5E);

  Color get white => const Color(0XFFE7E7E7);
}
