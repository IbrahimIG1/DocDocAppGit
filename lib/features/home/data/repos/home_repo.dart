import 'package:doc_doc_app/core/networking/api_error_handler.dart';
import 'package:doc_doc_app/core/networking/api_result.dart';
import 'package:doc_doc_app/features/home/data/api/home_api_services.dart';
import 'package:doc_doc_app/features/home/data/models/specializations_response_model.dart';

class HomeRepo {
  final HomeApiService _homeApiService;
  HomeRepo(this._homeApiService);

  Future<ApiResult<SpecializationResponseModel>> getSpecialization() async {
    try {
  final response = await _homeApiService.getSpecialization();
  return ApiResult.success(response);
} catch (error) {
  return ApiResult.failure(ErrorHandler.handle(error));
}
  }
}
