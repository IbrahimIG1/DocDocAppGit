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
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLenght = false;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
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
              if (value == null || value.isEmpty) {
                return 'please enter a valid email';
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          vericalSpace(18),
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
          vericalSpace(24),
          PasswordValidation(
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasSpecialCharacters: hasSpecialCharacters,
              hasNumber: hasNumber,
              hasMinLenght: hasMinLenght),
              
        ],
      ),
    );
  }
}
