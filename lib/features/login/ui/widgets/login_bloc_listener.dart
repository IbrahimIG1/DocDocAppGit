import 'package:doc_doc_app/core/Helpers/extensions.dart';
import 'package:doc_doc_app/core/Routing/routes.dart';
import 'package:doc_doc_app/core/theming/colors.dart';
import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:doc_doc_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doc_doc_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listenWhen: (previous, current) =>
            current is Loading || current is Success || current is Error,
        listener: (context, state) {
          state.whenOrNull(
            loading: () => showDialog(
              context: context,
              builder: (context) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: ColorsManager.mainBlue,
                ));
              },
            ),
            success: (loginResponse) {
              context.pop();
              context.pushNamed(Routes.homeScreen);
            },
            error: (error) {
              setupErorrState(context, error);
            },
          );
        },
        child: Container(
          color: Colors.red,
          width: 10,
          height: 10,
        ));
  }

  void setupErorrState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(
          Icons.error,
          size: 32,
          color: Colors.red,
        ),
        content: Text(
          error,
          style: TextStyles.font16GreyLightMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Get it',
              style: TextStyles.font14GreyDarkSemiBold,
            ),
          )
        ],
      ),
    );
  }
}
