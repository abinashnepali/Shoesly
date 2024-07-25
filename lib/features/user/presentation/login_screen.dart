import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:shoesly/core/presentation/resources/custom_text_style.dart';
import 'package:shoesly/core/presentation/resources/theme_helpers.dart';
import 'package:shoesly/core/presentation/widgets/appbar/custom_appbar.dart';
import 'package:shoesly/core/presentation/widgets/custom_elevated_button.dart';
import 'package:shoesly/core/presentation/widgets/custom_icon_button.dart';
import 'package:shoesly/core/presentation/widgets/textfields.dart.dart';
import 'package:shoesly/core/utils/custom_validators.dart';
import 'package:shoesly/core/utils/size_utils.dart';
import 'package:shoesly/features/user/data/model/usermodel.dart';
import 'package:shoesly/features/user/presentation/controller.dart/auth_controller.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final authController = Get.find<AuthController>();

  final Usermodel registerParams = Usermodel();

  void _onSave(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState?.save();
    authController.islogin.value
        ? authController.signInWithEmail(registerParams)
        : authController.signUpWithEmail(registerParams);
  }

  @override
  Widget build(BuildContext context) {
    var qmedia = MediaQuery.of(context).size.height;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Obx(
          () => ModalProgressHUD(
            inAsyncCall: authController.isLoading.value,
            opacity: 0.5,
            progressIndicator: const CircularProgressIndicator(
              color: Colors.blue,
            ),
            child: Scaffold(
              appBar: _appBarSection(),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: qmedia * 0.8,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: formsectionWidget(context),
                    ),
                  ),
                ),
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
    );
  }

  Icon _buildFormFieldIcon(IconData iconData, color) {
    return Icon(
      iconData,
      color: color,
    );
  }

  Widget formsectionWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            authController.islogin.value ? 'Login ' : 'Sign UP',
            style: theme.textTheme.headlineLarge,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            authController.islogin.value
                ? 'Welcome Back!!! Please Enter Your Details.'
                : 'Get on Board. Create your profile to start your Journey.',
            style: CustomTextStyles.bodySmallGray400,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        PrimaryFormField(
          hintTxt: 'Enter Your Email',
          validator: (value) => Validator.validateEmail(value!),
          isRequired: true,
          onSaved: (value) {
            registerParams.email = value;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        PrimaryFormField(
          hintTxt: 'Enter Your Password',
          isPassword: true,
          isRequired: true,
          validator: (value) => Validator.validatePassword(value!),
          onChanged: (value) => registerParams.password = value,
        ),
        const SizedBox(
          height: 10,
        ),
        Visibility(
            visible: !authController.islogin.value,
            child: Column(
              children: [
                PrimaryFormField(
                  hintTxt: 'Conform Password',
                  isPassword: true,
                  isRequired: true,
                  onChanged: (value) => registerParams.confirmPassword = value,
                  validator: (value) {
                    if (value?.isEmpty == true) {
                      return "This field is required";
                    } else if (registerParams.confirmPassword !=
                        registerParams.password) {
                      return "Password and confirm password don't match";
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                PrimaryFormField(
                  hintTxt: 'Enter Your Username',
                  validator: (value) => Validator.validateName(value!),
                  isRequired: true,
                  onSaved: (value) {
                    registerParams.username = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                PrimaryFormField(
                  hintTxt: 'Enter Your Address',
                  validator: (value) => Validator.validateName(value!),
                  isRequired: true,
                  onSaved: (value) {
                    registerParams.address = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                PrimaryFormField(
                  hintTxt: 'Enter Your Phone Number',
                  validator: (value) => Validator.validateNumber(value!),
                  isRequired: true,
                  onSaved: (value) {
                    registerParams.phonenumber = value;
                  },
                ),
              ],
            )),
        const SizedBox(
          height: 10,
        ),
        Visibility(
          visible: authController.islogin.value,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forget Password',
              style: CustomTextStyles.bodySmallGray700,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomElevatedButton(
          width: 300,
          allignment: Alignment.center,
          text: authController.islogin.value ? 'Login' : 'Sign Up',
          buttonTextStyle: CustomTextStyles.labelMediumWhite,
          onPressed: () => _onSave(context),
        ),
        const SizedBox(
          height: 20,
        ),
        authController.islogin.value
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do not have account?',
                    style: CustomTextStyles.bodySmallGray400,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () => authController.islogin.value =
                          !authController.islogin.value,
                      child: Text(
                        'Sign up',
                        style: CustomTextStyles.bodySmallGray400
                            .copyWith(color: appTheme.black900),
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Have Account?',
                    style: CustomTextStyles.bodySmallGray400,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () => authController.islogin.value =
                          !authController.islogin.value,
                      child: Text(
                        'Login',
                        style: CustomTextStyles.bodySmallGray400
                            .copyWith(color: appTheme.black900),
                      ),
                    ),
                  ),
                ],
              ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: SizedBox(
            height: 50,
            child: SignInButton(
              Buttons.google,
              text: authController.islogin.value
                  ? "Sign In with Google"
                  : "Sign up with Google",
              onPressed: () => authController.handleGoogleSignIn(),
            ),
          ),
        )
      ],
    );
  }
}
