import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesly/crore/presentation/resources/app_theme.dart';
import 'package:shoesly/crore/utils/size_utils.dart';

import 'crore/presentation/routes/app_pages.dart';
import 'crore/utils/constants.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ((context, orientation, deviceType) {
      return GetMaterialApp(
        title: kAppName,
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: Get.deviceLocale,
        themeMode: ThemeMode.light,
        theme: AppThemes.lightThemeData,
        darkTheme: AppThemes.darkThemeData,
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
      );
    }));
  }
}
