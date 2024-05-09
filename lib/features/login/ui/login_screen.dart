import 'package:doc_doc_app/core/Helpers/spacer_helper.dart';
import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:doc_doc_app/core/widgets/app_text_button.dart';
import 'package:doc_doc_app/features/login/data/models/login_request_body.dart';
import 'package:doc_doc_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doc_doc_app/features/login/ui/widgets/already_have_account.dart';
import 'package:doc_doc_app/features/login/ui/widgets/email_and_password.dart';
import 'package:doc_doc_app/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:doc_doc_app/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Welcome Back',
                style: TextStyles.font24BlueBold,
              ),
              vericalSpace(10),
              Text(
                'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                style: TextStyles.font16GreyRegular.copyWith(height: 1.7),
              ),
              vericalSpace(36),
              Column(children: [
                EmailAndPassword(),
                vericalSpace(24),
                Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text('Forgot Password?',
                        style: TextStyles.font14BlueRegular)),
                vericalSpace(40),
                AppTextButton(
                  textStyle: TextStyles.font16WhiteMeduim,
                  text: 'Login',
                  onpressed: () {
                    validateThenDoLogin(context);
                  },
                ),
                vericalSpace(16),
                const TeemsAndConditions(),
                vericalSpace(60),
                const AlreadyHaveAccount(),
                const LoginBlocListener(),
              ]),
            ]),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      print(context.read<LoginCubit>().emailController.text);
      print(context.read<LoginCubit>().passwordController.text);
      context.read<LoginCubit>().emitLoginStates(LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text));
    }
  }
}
