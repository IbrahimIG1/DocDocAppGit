import 'package:doc_doc_app/core/Helpers/app_regex.dart';
import 'package:doc_doc_app/core/Helpers/spacer_helper.dart';
import 'package:doc_doc_app/core/widgets/text_form_feild.dart';
import 'package:doc_doc_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doc_doc_app/features/login/ui/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  // validation variables
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setUpPasswodControllerListen();
  }

  void setUpPasswodControllerListen() {
    // listen to user password and check about
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(
            context.read<LoginCubit>().passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(
            context.read<LoginCubit>().passwordController.text);
        hasMinLength = AppRegex.hasMinLength(
            context.read<LoginCubit>().passwordController.text);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(
            context.read<LoginCubit>().passwordController.text);
        hasNumber = AppRegex.hasNumber(
            context.read<LoginCubit>().passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormFeild(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'please enter a valid email';
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormFeild(
            hintText: 'password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter a valid password';
              }
            },
            controller: passwordController,
            isObscure: isObscureText,
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(isObscureText
                    ? Icons.visibility_off
                    : Icons.visibility_outlined)),
          ),
          verticalSpace(24),
          PasswordValidation(
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasSpecialCharacters: hasSpecialCharacter,
              hasNumber: hasNumber,
              hasMinLenght: hasMinLength),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
