import 'package:doc_doc_app/core/Helpers/spacer_helper.dart';
import 'package:doc_doc_app/core/theming/colors.dart';
import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(left: index == 0 ? 0 : 24.w),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: ColorsManager.simpleGrey,
                  radius: 28.w,
                  child: Image.asset(
                    'assets/icons/doctor_europe_icon.png',
                    width: 40.w,
                    height: 40.h,
                  ),
                ),
                verticalSpace(10),
                Text(
                  'General',
                  style: TextStyles.font12GreyDarkRegular,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
