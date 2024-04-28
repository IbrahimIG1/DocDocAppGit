import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelperSpacer {
  static SizedBox horizontalSpace(double width) {
    return SizedBox(width:width.w );
  }
  static SizedBox vericalSpace(double height) {
    return SizedBox(height:height.h );
  }
}
