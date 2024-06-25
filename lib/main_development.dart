import 'package:doc_doc_app/core/Helpers/constants.dart';
import 'package:doc_doc_app/core/Helpers/extensions.dart';
import 'package:doc_doc_app/core/Helpers/shared_pref_helper.dart';
import 'package:doc_doc_app/core/Routing/app_router.dart';
import 'package:doc_doc_app/core/di/dependency_injection.dart';
import 'package:doc_doc_app/doc_app.dart';
// import 'package:doc_doc_app/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  setupGetIt();
  //  to fix text hiddin error in release mode
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedIn();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}

checkIfLoggedIn() async {
  String? userToken = await SharedPrefHelper.getString(SharedPrefKey.userToken);
  print(userToken);
  
  if (userToken.isNullOrEmpty()) {
    isUserLoggedIn = false;
  } else {
    isUserLoggedIn = true;
  }
  print(isUserLoggedIn);

}
