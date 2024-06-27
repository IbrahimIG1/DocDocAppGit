import 'package:doc_doc_app/core/Helpers/spacer_helper.dart';
import 'package:doc_doc_app/core/theming/colors.dart';
import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:doc_doc_app/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecializationItem extends StatelessWidget {
  final int index;
  final Color color;
  final int selectedItem;
  final SpecializationsData? specializationDatalist;
  const SpecializationItem({
    super.key,
    required this.index,
    required this.specializationDatalist,
    required this.selectedItem,
    required this.color,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: index == 0 ? 0 : 24.w),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            decoration: BoxDecoration(
              border: selectedItem == index
                  ? Border.all(color: Colors.black, width: 1)
                  : Border.all(width: 0),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundColor: ColorsManager.simpleGrey,
              radius: 28.w,
              child: Image.asset(
                'assets/icons/doctor_europe_icon.png',
                width: selectedItem == index ? 40.w : 40.w,
                height: selectedItem == index ? 43.h : 40.h,
              ),
            ),
          ),
          //  CircleAvatar(
          //     backgroundColor: ColorsManager.simpleGrey,
          //     radius: 28.w,
          //     child: Image.asset(
          //       'assets/icons/doctor_europe_icon.png',
          //       width: 40.w,
          //       height: 40.h,
          //     ),
          //   ),
          verticalSpace(10),
          Text(specializationDatalist!.name ?? 'specialization',
              style: selectedItem == index
                  ? TextStyles.font14BlueRegular.copyWith(color: color)
                  : TextStyles.font12GreyDarkRegular),
        ],
      ),
    );
  }
}
