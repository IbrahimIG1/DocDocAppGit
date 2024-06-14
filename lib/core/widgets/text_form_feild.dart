import 'package:doc_doc_app/core/theming/colors.dart';
import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:flutter/material.dart';

class AppTextFormFeild extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enableBorder;
  final InputBorder? foucedBorder;
  final String hintText;
  final TextStyle? hintTextStyle;
  final Widget? suffixIcon;
  final bool? isObscure;
  final Color? backGroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormFeild(
      {super.key,
      this.contentPadding,
      this.enableBorder,
      this.foucedBorder,
      required this.hintText,
      this.hintTextStyle,
      this.suffixIcon,
      this.isObscure,
      this.backGroundColor,
      this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: hintTextStyle ?? TextStyles.font16GreyLightMedium,
          focusedBorder: foucedBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1.3,
                  color: ColorsManager.mainBlue,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
          enabledBorder: enableBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1.3,
                  color: ColorsManager.greyLight,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.3),
            borderRadius: BorderRadius.circular(16.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.3),
            borderRadius: BorderRadius.circular(16.0),
          ),
          suffixIcon: suffixIcon,
          fillColor: backGroundColor ?? ColorsManager.greyLighter,
          filled: true),
      obscureText: isObscure ?? false,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
