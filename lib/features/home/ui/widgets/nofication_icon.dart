import 'package:doc_doc_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorsManager.simpleGrey,
      radius: 20.w,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Icon(
            Icons.notifications_none_rounded,
            color: ColorsManager.grey,
          ),
          Container(
            width: 10.w,
            height: 10.h,
            decoration:
                BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          )
        ],
      ),
    );
  }
}
