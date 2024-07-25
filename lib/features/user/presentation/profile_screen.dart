import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesly/core/presentation/resources/app_decoration.dart';
import 'package:shoesly/core/presentation/resources/custom_text_style.dart';

import 'package:shoesly/core/presentation/resources/theme_helpers.dart';
import 'package:shoesly/core/presentation/routes/app_routes.dart';
import 'package:shoesly/core/presentation/widgets/custom_icon_button.dart';
import 'package:shoesly/core/utils/constants.dart';
import 'package:shoesly/features/user/presentation/controller.dart/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final porfileCtr = Get.find<PorfileController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final imagepath = porfileCtr.getImageFile;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              // decoration: AppDecoration.fillgrey,
              color: Colors.white,
              width: double.maxFinite,
              padding: const EdgeInsets.only(top: 8),
              child: _appbarSection(size),
            ),
            // body

            Positioned(
              top: 140,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusStyle.customBorderTL20,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 50), // Space for the profile image
                      _ProfileMenuItem(
                          onTap: () {},
                          leadingIcon: Icons.person,
                          title: 'Name',
                          subtitle: porfileCtr.userinfo.username),

                      _ProfileMenuItem(
                          onTap: () {},
                          leadingIcon: Icons.home,
                          title: 'Address',
                          subtitle: porfileCtr.userinfo.address),
                      _ProfileMenuItem(
                          onTap: () {},
                          leadingIcon: Icons.email,
                          title: 'Email',
                          subtitle: porfileCtr.userinfo.email),

                      _ProfileMenuItem(
                          onTap: () {
                            Get.toNamed(Routes.editprofileScreen);
                          },
                          leadingIcon: Icons.edit,
                          title: 'Edit',
                          subtitle: 'Edit Profile'),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: (size.width / 2) - 80,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Stack(
                    children: [
                      imagepath != null
                          ? Image.file(
                              imagepath,
                              fit: BoxFit.cover,
                              width: 124,
                              height: 124,
                            )
                          : Image.asset(
                              Constants.porfileImageUrl,
                              fit: BoxFit.cover,
                              width: 140,
                              height: 140,
                            ),
                    ],
                  )),
            ),

            //
          ],
        ),
      ),
    );
  }

  Widget _appbarSection(Size size) {
    return SizedBox(
      height: size.height * 0.9,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomIconButton(
            icon: Icons.arrow_back_rounded,
            onPressed: () => Get.back(),
            color: appTheme.black900,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 8),
            child: Text(
              'Profile',
              style: theme.textTheme.titleLarge
                  ?.copyWith(color: appTheme.black900),
            ),
          ),
        ],
      ),
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
            : SizedBox(),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ));
  }
}
