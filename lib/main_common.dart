import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesly/core/presentation/resources/theme_helpers.dart';
import 'package:shoesly/core/utils/constants.dart';
import 'package:shoesly/core/utils/size_utils.dart';

import 'core/presentation/routes/app_pages.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ((context, orientation, deviceType) {
      return GetMaterialApp(
        title: Constants.kAppName,
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: Get.deviceLocale,
        themeMode: ThemeMode.light,
        theme: theme,
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
      );
    }));
  }
}
