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
      addContentType();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static addContentType() {
    dio?.options.headers = {
      'Accept':'application/json',
      'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzE4MzExNjY1LCJleHAiOjE3MTgzOTgwNjUsIm5iZiI6MTcxODMxMTY2NSwianRpIjoib0QxSnY4endUb1VGTTZ0ZiIsInN1YiI6IjExMjkiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.1xY14Oiw9pT_WLhS9FgKqWmIMySTC-kXV3JYLZuLh68'
  };
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
