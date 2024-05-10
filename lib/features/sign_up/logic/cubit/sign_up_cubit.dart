import 'package:doc_doc_app/features/sign_up/data/models/sign_up_request.dart';
import 'package:doc_doc_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:doc_doc_app/features/sign_up/logic/cubit/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());

  void emitSignUpStates(SignUpRequest signUpRequest) async {
    emit(const SignUpState.loading());
    final response = await _signUpRepo.signUp(signUpRequest);
    response.when(success: (signUpResponse) {
      emit(SignUpState.success(signUpResponse));
    }, failure: (error) {
      emit(SignUpState.error(error: error.apiErrorModel.message ?? ""));
    });
  }
}
