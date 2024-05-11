import 'package:doc_doc_app/core/Routing/app_router.dart';
import 'package:doc_doc_app/core/di/dependency_injection.dart';
import 'package:doc_doc_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  setupGetIt();
  //  to fix text hiddin error in release mode
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
