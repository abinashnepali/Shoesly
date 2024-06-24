import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    required this.text,
    this.onPressed,
    this.buttonStyle,
    this.buttontextStyle,
    this.isDisabled,
    this.height,
    this.width,
    this.marign,
    this.alignment,
  });

  final String? text;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? buttontextStyle;
  final bool? isDisabled;
  final double? height;
  final double? width;
  final EdgeInsets? marign;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
