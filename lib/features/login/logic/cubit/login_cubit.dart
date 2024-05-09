import 'package:doc_doc_app/features/login/data/models/login_request_body.dart';
import 'package:doc_doc_app/features/login/data/repos/login_repo.dart';
import 'package:doc_doc_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

final formKey = GlobalKey<FormState>();
TextEditingController passwordController = TextEditingController();
TextEditingController emailController = TextEditingController();

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);
/*
  (response.when): دي فانكشن من الاوتوجنيرات بتاع 
  ال api_result 
  الى فيه النتيجة بتاعة ال api اذا كان نجح او فشل 
*/
    response.when(success: (loginResponce) {
      emit(LoginState.success(loginResponce));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ""));
      /// هنا انا بديلة ايررور هاندلر الى انا عامله وجواه ابياي مودل الى انا عاملة برضو وفيه المفروض الماسدج الى بتيجي لو فيه ايرور فى الريسبونس
    });
  }
}
