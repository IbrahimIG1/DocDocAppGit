import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:flutter/material.dart';

class DoctorSpecialitySeeAll extends StatelessWidget {
  const DoctorSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Doctor Speciality', style: TextStyles.font18GreyDarkSemiBold),
        Spacer(),
        Text('See All', style: TextStyles.font12BlueRegular)
      ],
    );
  }
}
