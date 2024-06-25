import 'package:doc_doc_app/core/Helpers/constants.dart';
import 'package:doc_doc_app/core/Helpers/shared_pref_helper.dart';
import 'package:doc_doc_app/core/networking/dio_factory.dart';
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

  void emitLoginStates() async {
    emit(const LoginState.loading());
    LoginRequestBody loginRequestBody = LoginRequestBody(
        email: emailController.text, password: passwordController.text);
    final response = await _loginRepo.login(loginRequestBody);
    print("response :- ${response.toString()}");
/*
  (response.when): دي فانكشن من الاوتوجنيرات بتاع 
  ال api_result 
  الى فيه النتيجة بتاعة ال api اذا كان نجح او فشل 
*/
    response.when(success: (loginResponce) {
      saveUserToken(loginResponce.userData?.token ?? "");

      emit(LoginState.success(loginResponce));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ""));

      /// هنا انا بديلة ايررور هاندلر الى انا عامله وجواه ابياي مودل الى انا عاملة برضو وفيه المفروض الماسدج الى بتيجي لو فيه ايرور فى الريسبونس
    });
  }

// save token in shared prefrence
  Future<void> saveUserToken(String token) async {
    
    await SharedPrefHelper.setData(SharedPrefKey.userToken, token);
   await DioFactory.setUserTokenInHeader(token);
  }
}
