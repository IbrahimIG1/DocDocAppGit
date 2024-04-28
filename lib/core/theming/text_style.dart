import 'package:doc_doc_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font16BlackW600 = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle font32BBlueW700 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.mainBlue,
  );
  static TextStyle font16Grey = TextStyle(
    fontSize: 16.sp,
    color: Color(0xFF757575),
  );
  static TextStyle font16WhiteMeduim = TextStyle(
      fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w500);
}
