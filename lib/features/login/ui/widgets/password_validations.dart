import 'package:doc_doc_app/core/Helpers/spacer_helper.dart';
import 'package:doc_doc_app/core/theming/colors.dart';
import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLenght;
  const PasswordValidation({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLenght,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidaion('At least 1 lowercase letter', hasLowerCase),
        buildValidaion(
            'At least 1 hasSpecial Character letter', hasSpecialCharacters),
        buildValidaion('At least 1 uppercase letter', hasUpperCase),
        buildValidaion('At least 1 Number', hasNumber),
        buildValidaion('At least 8 characters long', hasMinLenght),
      ],
    );
  }

  Widget buildValidaion(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.grey,
        ),
        horizontalSpace(16),
        Text(text,
            style: TextStyles.font13DarkGreyRegular.copyWith(
              decoration: hasValidated ? TextDecoration.lineThrough : null,
              decorationColor: Colors.green,
              decorationThickness: 2,
              color: hasValidated ? ColorsManager.grey : ColorsManager.greyDark,
            )),
      ],
    );
  }
}
