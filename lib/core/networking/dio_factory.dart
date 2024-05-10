import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio? dio;

  /// That constractor to prevent take any object from DioFactory class
  DioFactory._();

  static Dio getDio() {
    // definition the time required to the server (connect and reverce)
    Duration timeOut = Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        // ..options.contentType =Headers.formUrlEncodedContentType
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
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
