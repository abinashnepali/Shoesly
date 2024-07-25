import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shoesly/core/presentation/resources/custom_text_style.dart';
import 'package:shoesly/core/presentation/resources/theme_helpers.dart';

import 'package:shoesly/core/presentation/routes/app_routes.dart';
import 'package:shoesly/core/presentation/widgets/appbar/appbar_title.dart';
import 'package:shoesly/core/presentation/widgets/appbar/custom_appbar.dart';
import 'package:shoesly/core/presentation/widgets/custom_dialog.dart';
import 'package:shoesly/core/utils/constants.dart';
import 'package:shoesly/core/utils/size_utils.dart';
import 'package:shoesly/features/user/presentation/controller.dart/auth_controller.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final authCtr = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppbarSection(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _ProfileMenuItem(
                  onTap: () {},
                  leadingIcon: Icons.location_city_rounded,
                  title: 'Add Or Edit Address',
                  subtitle: 'Change Your Address'),

              _ProfileMenuItem(
                  onTap: () {},
                  leadingIcon: Icons.settings,
                  title: 'Setting',
                  subtitle: 'Change Setting'),

              Obx(() => Visibility(
                    visible: authCtr.checklogin,
                    child: _ProfileMenuItem(
                        onTap: () {
                          Get.toNamed(Routes.profileScreen);
                        },
                        leadingIcon: Icons.person,
                        title: 'Profile',
                        subtitle: 'View or Edit Profile'),
                  )),

              Obx(
                () => SizedBox(
                  child: authCtr.checklogin == true
                      ? _ProfileMenuItem(
                          onTap: () => buildDialod(),
                          leadingIcon: Icons.logout_rounded,
                          title: 'Log Out',
                          subtitle: 'Log out')
                      : _ProfileMenuItem(
                          onTap: () {
                            Get.toNamed(Routes.loginScreen);
                          },
                          leadingIcon: Icons.login_outlined,
                          title: 'Sign In',
                          subtitle: 'Sign In'),
                ),
              ),

              //
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildDialod() {
    return Get.defaultDialog(
        backgroundColor: Colors.white,
        cancelTextColor: appTheme.black900,
        buttonColor: appTheme.black900,
        middleText: 'Are You Sure You Want to Logout?',
        middleTextStyle: CustomTextStyles.bodyMediumGray600,
        onCancel: () => Get.back(),
        onConfirm: () {
          authCtr.logout();
          Get.toNamed(Routes.loginScreen);
        });
  }

  PreferredSizeWidget _buildAppbarSection() {
    return CustomeAppBar(
      height: 80.v,
      title: AppbarTitle(text: 'Setting', margin: EdgeInsets.only(left: 31.h)),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final VoidCallback onTap;
  final IconData leadingIcon;
  final String title;
  final String? subtitle;

  const _ProfileMenuItem(
      {Key? key,
      required this.onTap,
      required this.leadingIcon,
      required this.title,
      this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        leading: Icon(leadingIcon),
        title: Text(
          title,
          style: CustomTextStyles.bodyMediumBlack900,
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle!,
                style: CustomTextStyles.titleSmallGray600,
              )
            : const SizedBox(),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ));
  }
}
