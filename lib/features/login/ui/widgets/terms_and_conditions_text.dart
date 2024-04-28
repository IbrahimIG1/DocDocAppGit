import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:flutter/material.dart';

class TeemsAndConditions extends StatelessWidget {
  const TeemsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: 'By logging, you agree to our',
              style: TextStyles.font14GreyRegular),
          TextSpan(
              text: ' Terms & Conditions ',
              style: TextStyles.font13DarkGreyRegular),
          TextSpan(
              text: '\nand',
              style: TextStyles.font14GreyRegular.copyWith(height: 1.5)),
          TextSpan(
              text: ' PrivacyPolicy.', style: TextStyles.font13DarkGreyRegular),
        ]));
  }
}
