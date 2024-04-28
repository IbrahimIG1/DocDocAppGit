import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: 'Already have an account yet?',
          style: TextStyles.font13DarkGreyRegular),
      TextSpan(text: ' Sign Up', style: TextStyles.font13BlueRegular)
    ]));
  }
}
