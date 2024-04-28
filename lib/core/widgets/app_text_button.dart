import 'package:doc_doc_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final Color? backgroundColor;
  final TextStyle textStyle;
  final double? borderRaduis;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? horizontalPadding;
  final double? verticalPadding;
  final String text;
  final VoidCallback onpressed;

  const AppTextButton(
      {super.key,
      this.backgroundColor,
      required this.textStyle,
      this.buttonHeight,
      this.buttonWidth,
      required this.text,
      required this.onpressed,
      this.horizontalPadding,
      this.verticalPadding,
      this.borderRaduis});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRaduis ?? 16.0))),
          backgroundColor: MaterialStateProperty.all(
              backgroundColor ?? ColorsManager.mainBlue),
          // textStyle: MaterialStateProperty.all(textStyle),
          fixedSize: MaterialStateProperty.all(
            Size(buttonWidth?.w ?? double.maxFinite, buttonHeight?.h ?? 50.h),
          ),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(
              horizontal: horizontalPadding?.w ?? 12.w,
              vertical: verticalPadding?.h ?? 14.h))),
      child: Text(text, style: textStyle),
      onPressed: onpressed,
    );
  }
}
