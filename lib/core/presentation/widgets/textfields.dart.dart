import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shoesly/core/presentation/resources/theme_helpers.dart';

class PrimaryFormField extends HookWidget {
  final String? label;
  final String? hintTxt;
  final Widget? hintIcon;
  final bool? isFilled;
  final bool isRequired;

  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onSaved;
  final Widget? prefixIcon;
  final double? labelHeight;
  final bool? isPassword;
  final TextInputType? keyboardType;

  final int maxLines;
  final int? minLines;

  final String? initialValue;

  const PrimaryFormField({
    Key? key,
    this.hintTxt,
    this.initialValue,
    this.hintIcon,
    this.label,
    this.isRequired = false,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.minLines,
    this.onSaved,
    this.prefixIcon,
    this.labelHeight,
    this.isPassword = false,
    this.isFilled = false,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPasswordVisible = useState(isPassword!);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (prefixIcon != null)
                Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: prefixIcon!),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: label!,
                      style: Theme.of(context).textTheme.labelMedium),
                  if (isRequired)
                    TextSpan(
                        text: " *",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: Colors.red)),
                ]),
              ),
            ],
          ),
        SizedBox(
          height: labelHeight ?? 10,
        ),
        TextFormField(
          minLines: minLines,
          maxLines: maxLines,
          initialValue: initialValue,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          onSaved: onSaved != null
              ? (value) {
                  onSaved!(value!);
                }
              : null,
          onChanged: onChanged,
          obscureText: isPasswordVisible.value,
          decoration: InputDecoration(
            errorMaxLines: 2,
            prefixIcon: hintIcon,
            suffixIcon: isPassword!
                ? GestureDetector(
                    onTap: () {
                      isPasswordVisible.value = !isPasswordVisible.value;
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Icon(
                          isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColor),
                    ))
                : const SizedBox.shrink(),
            hintText: hintTxt,
            hintStyle: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: appTheme.gray400),
            filled: isFilled!,
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            fillColor: Colors.white,
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(
                color: //textFieldBorderColor ??
                    Theme.of(context).primaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}

class PrimaryDropDownFormField<T> extends StatelessWidget {
  final String label;
  final bool isRequired;
  final List<T> items;
  final T? value;
  final String Function(T) itemToString;
  final void Function(T?) onChanged;
  final String? Function(T?)? validator;

  const PrimaryDropDownFormField({
    Key? key,
    required this.label,
    required this.items,
    this.value,
    required this.itemToString,
    required this.onChanged,
    this.isRequired = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: label, style: Theme.of(context).textTheme.labelMedium),
            if (isRequired)
              TextSpan(
                  text: " *",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: Colors.red)),
          ]),
        ),
        const SizedBox(height: 4),
        DropdownButtonFormField<T>(
          validator: validator,
          isDense: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              gapPadding: 0,
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          ),
          value: value,
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: SizedBox(width: 20, child: Text(itemToString(item))),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
