import 'package:doc_doc_app/core/Helpers/app_regex.dart';
import 'package:doc_doc_app/core/Helpers/spacer_helper.dart';
import 'package:doc_doc_app/core/widgets/text_form_feild.dart';
import 'package:doc_doc_app/features/login/ui/widgets/password_validations.dart';
import 'package:doc_doc_app/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  // validation variables
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasPhoneNumber = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;

    setUpPasswodControllerListen();
  }

  void setUpPasswodControllerListen() {
    // listen to user password and check about
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(
            context.read<SignUpCubit>().passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(
            context.read<SignUpCubit>().passwordController.text);
        hasMinLength = AppRegex.hasMinLength(
            context.read<SignUpCubit>().passwordController.text);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(
            context.read<SignUpCubit>().passwordController.text);
        hasNumber = AppRegex.hasNumber(
            context.read<SignUpCubit>().passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormFeild(
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter a your name';
              }
            },
            controller: context.read<SignUpCubit>().nameController,
          ),
          verticalSpace(18),
          AppTextFormFeild(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'please enter a valid email';
              }
            },
            controller: context.read<SignUpCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormFeild(
            hintText: 'phone',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'please enter a valid phone';
              }
            },
            controller: context.read<SignUpCubit>().phoneController,
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
            isObscure: isPasswordObscureText,
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordObscureText = !isPasswordObscureText;
                  });
                },
                child: Icon(isPasswordObscureText
                    ? Icons.visibility_off
                    : Icons.visibility_outlined)),
          ),
          verticalSpace(18),
          AppTextFormFeild(
            hintText: 'Password Confirmation',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter a the same password';
              }
            },
            controller:
                context.read<SignUpCubit>().passwordConfirmationController,
            isObscure: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordConfirmationObscureText =
                        !isPasswordConfirmationObscureText;
                  });
                },
                child: Icon(isPasswordConfirmationObscureText
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
