import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:flutter/material.dart';

class DoctorSpecialitySeeAll extends StatelessWidget {
  final String text;
  const DoctorSpecialitySeeAll({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: TextStyles.font18GreyDarkSemiBold),
        Spacer(),
        Text('See All', style: TextStyles.font12BlueRegular)
      ],
    );
  }
}
