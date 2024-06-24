import 'package:dio/dio.dart';
import 'package:doc_doc_app/core/networking/api_constants.dart';
import 'package:doc_doc_app/features/home/data/api/home_api_constance.dart';
import 'package:doc_doc_app/features/home/data/models/specializations_response_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart' hide Headers;
part 'home_api_services.g.dart';

@RestApi(baseUrl: ApiConstance.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;


  @GET(HomeApiConstances.specializationEP)
  Future<SpecializationsResponseModel> getSpecialization();
}
