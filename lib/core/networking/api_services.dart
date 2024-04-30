import 'package:dio/dio.dart';
import 'package:doc_doc_app/core/networking/api_constants.dart';
import 'package:doc_doc_app/features/login/data/models/login_request_body.dart';
import 'package:doc_doc_app/features/login/data/models/login_responce_body.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstance.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @POST(ApiConstance.login)
  Future<LoginResponce> login(@Body() LoginRequestBody loginRequestBody);

  // انا المفروض كنت هكتب الكود دا كدا علشا العمل لوجين بس الاو جنيرات عملها ومش مضطر أكتبها خلاص
  // thanks retrofit

  
//  myLogin()async{ var dio = Dio();
// var response = await dio.request(
//   '${ApiConstance.apiBaseUrl}/auth/login',
//   options: Options(
//     method: 'POST',
//     headers:{ 
//   'Accept': 'application/json'
// }
//   ),
//   data: {'email': 'a@a.com',
//   'password': 'password'},
// );
// }
}
