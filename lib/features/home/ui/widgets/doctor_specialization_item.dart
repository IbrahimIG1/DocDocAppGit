import 'package:doc_doc_app/core/Helpers/spacer_helper.dart';
import 'package:doc_doc_app/core/theming/colors.dart';
import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:doc_doc_app/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecializationItem extends StatelessWidget {
  final int index;
  final SpecializationsData? specializationDatalist;
  const DoctorSpecializationItem({super.key, required this.index,required this.specializationDatalist});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            specializationDatalist!.name ?? 'specialization',
            style: TextStyles.font12GreyDarkRegular,
          )
        ],
      ),
    );
  }
}
