import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoesly/crore/presentation/resources/custom_text_style.dart';
import 'package:shoesly/crore/presentation/resources/theme_helpers.dart';
import 'package:shoesly/crore/utils/size_utils.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus,
    this.textStyle,
    this.obscureText,
    this.textInputAction,
    this.textInputType,
    this.maxLines,
    this.hinText,
    this.hintTextStyle,
    this.prefix,
    this.prefixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled,
    this.validator,
    this.suffix,
    this.suffixConstraints,
  });

  final Alignment? alignment;
  final double? width;
  final TextEditingController? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hinText;
  final TextStyle? hintTextStyle;
  final Widget? prefix;
  final Widget? suffix;
  final BoxConstraints? prefixConstraints;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: textFormField,
          )
        : textFormField;
  }

  Widget get textFormField => SizedBox(
        width: width ?? double.maxFinite,
        child: TextFormField(
          scrollPadding: EdgeInsets.only(
            bottom: MediaQuery.of(Get.context!).viewInsets.bottom,
          ),
          controller: controller,
          focusNode: focusNode,
          autofocus: autofocus ?? false,
          style: textStyle ?? CustomTextStyles.bodyMediumBlack900,
          obscureText: obscureText ?? false,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: _decoration,
          validator: validator,
          cursorColor: ColorSchemes.lighCodeColorSchema.onPrimaryContainer,
        ),
      );

  InputDecoration get _decoration => InputDecoration(
        hintText: hinText ?? '',
        hintStyle: hintTextStyle ?? CustomTextStyles.bodyMediumBlack900,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 3.v),
        fillColor: fillColor,
        filled: filled,
        border: borderDecoration ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: appTheme.black900,
              ),
            ),
        enabledBorder: borderDecoration ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: appTheme.black900,
              ),
            ),
        focusedBorder: borderDecoration ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: appTheme.black900,
              ),
            ),
      );
}
