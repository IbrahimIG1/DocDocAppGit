import 'package:dio/dio.dart';
import 'package:doc_doc_app/core/networking/api_services.dart';
import 'package:doc_doc_app/core/networking/dio_factory.dart';
import 'package:doc_doc_app/features/home/data/api/home_api_services.dart';
import 'package:doc_doc_app/features/home/data/repos/home_repo.dart';
import 'package:doc_doc_app/features/login/data/repos/login_repo.dart';
import 'package:doc_doc_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doc_doc_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/sign_up/logic/cubit/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {

  /// registerLazySingleton علشان بتكريت الاوبجيكت مرة واحدة بس 
  // Dio & ApiServices
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
// sign up
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(()=>HomeRepo(getIt()));
  /*
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  بدل ما اعمل ده انا هنادى علي الكيوبت مباشر من الكلاس بتاعه فى الروتر
   علشان اناكدا كدا هعمله فاكتورى يعنى كل مرة احتاجه هيعمل انستانس جديد يبقي ملهاش لازمة اعمله فى جيت ات
  */

  
}
