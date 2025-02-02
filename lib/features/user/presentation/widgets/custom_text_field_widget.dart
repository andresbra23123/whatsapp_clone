import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_clone/core/core.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.readOnly,
    this.textAlign,
    this.textInputType,
    this.textInputAction = TextInputAction.next,
    this.prefixIcon,
    this.onTap,
    this.trailingIcon,
    this.onChanged,
    this.fontSize,
    this.autoFocus,
    this.maxLength,
  });

  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final Widget? trailingIcon;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final String? hintText;
  final double? fontSize;
  final bool? readOnly;
  final bool? autoFocus;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onChanged: onChanged,
      controller: controller,
      readOnly: readOnly ?? false,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      textAlign: textAlign ?? TextAlign.center,
      autofocus: autoFocus ?? false,
      style: TextStyle(fontSize: fontSize),
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
      ],
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(minWidth: 15, maxWidth: 20),
        suffixIcon: trailingIcon,
        suffixIconConstraints: const BoxConstraints(),
        hintText: hintText,
        hintStyle: const TextStyle(color: AppThemeColors.greyColor),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppThemeColors.greenColorOne,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppThemeColors.greenColorOne,
            width: 2,
          ),
        ),
      ),
    );
  }
}
