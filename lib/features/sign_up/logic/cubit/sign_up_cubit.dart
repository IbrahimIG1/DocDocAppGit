import 'package:doc_doc_app/features/sign_up/data/models/sign_up_request.dart';
import 'package:doc_doc_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:doc_doc_app/features/sign_up/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void emitSignUpStates() async {
    emit(const SignUpState.signUpLoading());
    final response = await _signUpRepo.signUp(SignUpRequest(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        gender: 0,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text));
    response.when(success: (signUpResponse) {
      print('signUpSuccess');
      emit(SignUpState.signUpSuccess(signUpResponse));
    }, failure: (error) {
      print('signUpError ${error.apiErrorModel.message.toString()}');

      emit(SignUpState.signUpError(error: error.apiErrorModel.message ?? ""));
    });
  }
}
