import 'package:flutter/material.dart';
import 'package:shoesly/crore/presentation/resources/theme_helpers.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double? iconSize;
  final Color? color;
  final Color? disabledColor;
  final Alignment? alignment;

  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.iconSize,
    this.color,
    this.disabledColor,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: buildIconButton,
          )
        : buildIconButton;
  }

  Widget get buildIconButton => IconButton(
        icon: Icon(icon),
        color: color ?? Color(0xFF101010),
        onPressed: onPressed,
        iconSize: iconSize ?? 24,
      );
}
