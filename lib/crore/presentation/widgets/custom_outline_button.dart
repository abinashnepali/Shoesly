import 'package:flutter/material.dart';
import 'package:shoesly/crore/presentation/resources/theme_helpers.dart';
import 'package:shoesly/crore/presentation/widgets/base_button.dart';
import 'package:shoesly/crore/utils/size_utils.dart';

class CustomOutlineButton extends BaseButton {
  CustomOutlineButton(
      {Key? key,
      this.decoration,
      this.leftIcon,
      this.rightIcon,
      this.label,
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
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: buildOutlineButtonWidget,
          )
        : buildOutlineButtonWidget;
  }

  Widget get buildOutlineButtonWidget => Container(
        height: this.height ?? 50.v,
        width: this.width ?? double.maxFinite,
        margin: marign,
        decoration: decoration,
        child: OutlinedButton(
          style: buttonStyle,
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(
                text!,
                style: buttontextStyle ?? theme.textTheme.titleSmall,
              ),
              rightIcon ?? const SizedBox.shrink()
            ],
          ),
        ),
      );
}
