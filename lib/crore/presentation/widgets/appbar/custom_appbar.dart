import 'package:flutter/material.dart';
import 'package:shoesly/crore/presentation/resources/theme_helpers.dart';
import 'package:shoesly/crore/utils/size_utils.dart';

enum Style { bigFill }

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomeAppBar(
      {super.key,
      this.height,
      this.styleType,
      this.leadingWidth,
      this.leading,
      this.title,
      this.centerTitle,
      this.action});

  final double? height;
  final Style? styleType;
  final double? leadingWidth;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? action;

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
      default:
        return null;
    }
  }
}
