import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoesly/core/presentation/resources/app_decoration.dart';
import 'package:shoesly/core/presentation/resources/custom_text_style.dart';
import 'package:shoesly/core/presentation/resources/theme_helpers.dart';
import 'package:shoesly/core/presentation/widgets/custom_outline_button.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog(
      {super.key,
      this.align,
      required this.titleText,
      this.titleTextStyle,
      required this.backbuttonlabel,
      required this.confirmbuttonlabel,
      required this.confirmbutton,
      this.cancelbutton,
      this.contentText});

  final Alignment? align;
  final String? titleText;
  final TextStyle? titleTextStyle;
  final String? backbuttonlabel;
  final String? confirmbuttonlabel;
  final String? contentText;
  final Function? confirmbutton;
  Function(String)? cancelbutton;

  @override
  Widget build(BuildContext context) {
    return align != null
        ? Align(
            alignment: align!,
            child: showDialogWidget,
          )
        : showDialogWidget;
  }

  Widget get showDialogWidget => Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadiusStyle.roundedBorder20,
            color: appTheme.gray200),
        child: CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(titleText!,
                style: titleTextStyle ?? CustomTextStyles.titleMediumBlack9001),
          ),
          content: contentText != null
              ? Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    contentText!,
                    style: CustomTextStyles.bodySmallGray700,
                  ),
                )
              : const SizedBox(),
          actions: [
            CustomOutlineButton(
              text: backbuttonlabel!,
              onPressed: () {
                cancelbutton ?? Get.back();
              },
            ),
            CustomOutlineButton(
              text: confirmbuttonlabel!,
              onPressed: () {
                confirmbutton;
              },
            ),
          ],
        ),
      );
}
