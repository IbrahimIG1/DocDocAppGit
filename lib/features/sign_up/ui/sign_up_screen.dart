import 'package:doc_doc_app/core/Helpers/spacer_helper.dart';
import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:doc_doc_app/core/widgets/app_text_button.dart';
import 'package:doc_doc_app/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:doc_doc_app/features/sign_up/ui/widgets/already_have_account.dart';
import 'package:doc_doc_app/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                'Create Account',
                style: TextStyles.font24BlueBold,
              ),
              vericalSpace(10),
              Text(
                'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                style: TextStyles.font16GreyRegular.copyWith(height: 1.7),
              ),
              vericalSpace(36),
              Column(children: [
                SignUpForm(),
                vericalSpace(40),
                AppTextButton(
                  textStyle: TextStyles.font16WhiteMeduim,
                  text: 'Sign up',
                  onpressed: () {
                    validateThenDoSignUp(context);
                  },
                ),
                vericalSpace(16),
                const AlreadyHaveAccount(),
                const SignUpBlocListener()
              ]),
            ]),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignUp(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUpStates();
    }
  }
}
