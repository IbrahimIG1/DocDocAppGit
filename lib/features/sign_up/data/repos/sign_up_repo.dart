import 'package:doc_doc_app/core/networking/api_error_handler.dart';
import 'package:doc_doc_app/core/networking/api_result.dart';
import 'package:doc_doc_app/core/networking/api_services.dart';
import 'package:doc_doc_app/features/sign_up/data/models/sign_up_request.dart';
import 'package:doc_doc_app/features/sign_up/data/models/sign_up_response.dart';

class SignUpRepo {
  final ApiServices _apiServices;
  SignUpRepo(this._apiServices);

  Future<ApiResult<SignUpResponse>> signUp(SignUpRequest signUpRequest) async {
    try {
      final response = await _apiServices.register(signUpRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
