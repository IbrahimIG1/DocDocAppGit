import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:flutter/material.dart';

class HiName extends StatelessWidget {
  const HiName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi,Omar!',
                        style: TextStyles.font18GreyDarkBold,
                      ),
                      Text(
                        'How Are you Today?',
                        style: TextStyles.font11GreyLightRegular,
                      ),
                    ],
                  );
  }
}