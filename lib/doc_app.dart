import 'package:doc_doc_app/core/Routing/app_router.dart';
import 'package:doc_doc_app/core/theming/colors.dart';
import 'package:doc_doc_app/features/onbording/onbording_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/Routing/routes.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:Size(375, 812) ,
      minTextAdapt: true,
      child: MaterialApp
      (
        debugShowCheckedModeBanner: false,
        title: 'Doc Doc',
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: Routes.onBordingScreen,
        onGenerateRoute: appRouter.generateRout,
        home: OnBordingScreen(),
      ),
    );
  }
}
