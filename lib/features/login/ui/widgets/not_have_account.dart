import 'package:doc_doc_app/core/Helpers/extensions.dart';
import 'package:doc_doc_app/core/Routing/routes.dart';
import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NotHaveAccount extends StatelessWidget {
  const NotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: 'Do\'t have an account yet?',
          style: TextStyles.font13GreyDarkRegular),
      TextSpan(
          text: ' Sign Up',
          style: TextStyles.font13BlueRegular,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              context.pushReplacmentNamed(Routes.signUpScreen);
            })
    ]));
  }
}
