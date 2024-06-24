import 'package:flutter/material.dart';
import 'package:shoesly/core/presentation/resources/custom_text_style.dart';
import 'package:shoesly/core/presentation/resources/theme_helpers.dart';
import 'package:shoesly/core/utils/size_utils.dart';

enum Style { bigFill, mediumFill, smallFill }

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomeAppBar(
      {super.key,
      this.height,
      this.styleType,
      this.leadingWidth,
      this.leading,
      this.title,
      this.centerTitle,
      this.action,
      this.titleTextStyle});

  final double? height;
  final Style? styleType;
  final double? leadingWidth;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? action;
  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 55.v,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: action,
      titleTextStyle: titleTextStyle ?? CustomTextStyles.bodyMediumBlack900,
    );
  }

  Size get preferredSize => Size(SizeUtils.width, height ?? 55.v);

  _getStyle() {
    switch (styleType) {
      case Style.bigFill:
        return Container(
          height: 55.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: theme.colorScheme.secondaryContainer,
          ),
        );

      case Style.mediumFill:
        return Container(
          height: 40.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: theme.colorScheme.secondaryContainer,
          ),
        );

      case Style.smallFill:
        return Container(
          height: 30.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: theme.colorScheme.secondaryContainer,
          ),
        );

      default:
        return null;
    }
  }
}
