import 'package:doc_doc_app/core/Helpers/extensions.dart';
import 'package:doc_doc_app/core/Routing/routes.dart';
import 'package:doc_doc_app/core/theming/colors.dart';
import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetSatrtButton extends StatelessWidget {
  const GetSatrtButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      child: Text(
        'Get Started',
        style: TextStyles.font16WhiteMeduim,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorsManager.mainBlue),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all(Size(double.infinity, 52.h)),
      ),
    );
  }
}
