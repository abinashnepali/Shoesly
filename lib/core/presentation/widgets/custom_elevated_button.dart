import 'package:flutter/material.dart';
import 'package:shoesly/core/presentation/resources/custom_text_style.dart';
import 'package:shoesly/core/presentation/widgets/base_button.dart';
import 'package:shoesly/core/utils/size_utils.dart';

class CustomElevatedButton extends BaseButton {
  CustomElevatedButton(
      {Key? key,
      this.decoration,
      this.leftIcon,
      this.rightIcon,
      EdgeInsets? margin,
      VoidCallback? onPressed,
      ButtonStyle? buttonStyle,
      Alignment? allignment,
      TextStyle? buttonTextStyle,
      bool? isDisable,
      double? height,
      double? width,
      required String text})
      : super(
            text: text,
            onPressed: onPressed,
            alignment: allignment,
            buttonStyle: buttonStyle,
            height: height,
            width: width,
            isDisabled: isDisable,
            marign: margin,
            buttontextStyle: buttonTextStyle);

  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: buildElevatedButtonWidget,
          )
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
        height: this.height ?? 50.v,
        width: this.width ?? double.maxFinite,
        margin: marign,
        decoration: decoration,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(
                text!,
                style: buttontextStyle ??
                    CustomTextStyles.titleSmallSecondaryContainer,
              ),
              rightIcon ?? const SizedBox.shrink()
            ],
          ),
        ),
      );
}
