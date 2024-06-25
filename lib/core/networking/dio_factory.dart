import 'package:dio/dio.dart';
import 'package:doc_doc_app/core/Helpers/constants.dart';
import 'package:doc_doc_app/core/Helpers/shared_pref_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio? dio;

  /// That constractor to prevent take any object from DioFactory class
  DioFactory._();

  static Dio getDio() {
    // definition the time required to the server (connect and reverce)
    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        // ..options.contentType =Headers.formUrlEncodedContentType
        ..options.receiveTimeout = timeOut;
      addContentType();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static addContentType() async{
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${await SharedPrefHelper.getString(SharedPrefKey.userToken)}'
    };
  }

  // to save token after get it again because the dio is init once and this function to save token after init dio and after token come 
  static setUserTokenInHeader(String token) {
    dio?.options.headers = {'Authorization': 'Bearer $token'};
  }

  /// this PrettyDioLogger To show me data moving to nd from api in terminal (only for that)
  static void addDioInterceptor() {
    dio!.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
  }
}
