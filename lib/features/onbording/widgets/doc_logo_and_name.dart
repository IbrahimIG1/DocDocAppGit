import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocLogAndName extends StatelessWidget {
  const DocLogAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SvgPicture.asset('assets/svg/title_icon.svg'),
      SizedBox(
        width: 5.w,
      ),
      Text(
        'Docdoc',
        style: TextStyles.font26BlackSemiBold,
      ),
    ]);
  }
}
