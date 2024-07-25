import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:shoesly/core/presentation/resources/custom_text_style.dart';
import 'package:shoesly/core/presentation/resources/theme_helpers.dart';
import 'package:shoesly/core/presentation/widgets/appbar/custom_appbar.dart';
import 'package:shoesly/core/presentation/widgets/custom_elevated_button.dart';
import 'package:shoesly/core/presentation/widgets/custom_icon_button.dart';
import 'package:shoesly/core/presentation/widgets/textfields.dart.dart';
import 'package:shoesly/core/utils/constants.dart';
import 'package:shoesly/core/utils/custom_validators.dart';
import 'package:shoesly/core/utils/size_utils.dart';
import 'package:shoesly/features/user/data/model/usermodel.dart';
import 'package:shoesly/features/user/presentation/controller.dart/profile_controller.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final Usermodel userParams = Usermodel();
  final porfileCtr = Get.find<PorfileController>();

  final _formKey = GlobalKey<FormState>();

  void _onSave(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState?.save();
    porfileCtr.updateProfile(userParams);
  }

  void _showImagePickerDialog() {
    Get.dialog(AlertDialog(
      title: Text(
        'Select Image Source',
        style: CustomTextStyles.bodyLargeGray600,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: Text('Camera', style: CustomTextStyles.bodyMediumBlack900),
            onTap: () {
              porfileCtr.retrieveImageFromMobile(ImageSource.camera);
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo),
            title: Text(
              'Gallery',
              style: CustomTextStyles.bodyMediumBlack900,
            ),
            onTap: () {
              porfileCtr.retrieveImageFromMobile(ImageSource.gallery);
              Get.back();
            },
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ModalProgressHUD(
      inAsyncCall: porfileCtr.isLoding.value,
      opacity: 0.5,
      progressIndicator: const CircularProgressIndicator(
        color: Colors.blue,
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: _appBarSection(),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 68,
                    backgroundColor: appTheme.white,
                    child: GetBuilder<PorfileController>(builder: (context) {
                      final imagepath = porfileCtr.getImageFile;
                      return ClipRRect(
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
                              Positioned(
                                bottom: 0,
                                right: (size.width / 2) - 154,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: appTheme.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  width: 36,
                                  height: 36,
                                  child: Center(
                                    child: CustomIconButton(
                                      icon: Icons.add_a_photo,
                                      color: appTheme.gray700,
                                      iconSize: 22,
                                      onPressed: () async {
                                        final hasPermission = await porfileCtr
                                            .requestPermission();
                                        if (hasPermission) {
                                          _showImagePickerDialog();
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ));
                    }),
                  ),
                  GetBuilder<PorfileController>(
                      init: PorfileController(),
                      builder: (context) {
                        final Usermodel userinfo = porfileCtr.userinfo;
                        return Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              PrimaryFormField(
                                hintTxt: 'Enter Your Name',
                                validator: (value) =>
                                    Validator.validateName(value!),
                                isRequired: true,
                                initialValue: userinfo.username ?? '',
                                onSaved: (value) {
                                  userParams.username = value;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              PrimaryFormField(
                                hintTxt: 'Enter Your Email',
                                initialValue: userinfo.email ?? '',
                                validator: (value) =>
                                    Validator.validateEmail(value!),
                                isRequired: true,
                                onSaved: (value) {
                                  userParams.email = value;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              PrimaryFormField(
                                hintTxt: 'Enter Your Address',
                                validator: (value) =>
                                    Validator.validateName(value!),
                                isRequired: true,
                                initialValue: userinfo.address ?? '',
                                onSaved: (value) {
                                  userParams.address = value;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              PrimaryFormField(
                                hintTxt: 'Enter Your Phone Number',
                                validator: (value) =>
                                    Validator.validateNumber(value!),
                                initialValue: userinfo.phonenumber ?? '',
                                isRequired: true,
                                onSaved: (value) {
                                  userParams.phonenumber = value;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      }),
                  CustomElevatedButton(
                    width: 300,
                    allignment: Alignment.center,
                    text: 'Updated',
                    buttonTextStyle: CustomTextStyles.labelMediumWhite,
                    onPressed: () => _onSave(context),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBarSection() {
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
          'Edit Profile',
        ),
      ),
      titleTextStyle: CustomTextStyles.titleMediumBlack9001,
    );
  }
}
