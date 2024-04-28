import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:doc_doc_app/features/onbording/widgets/doc_logo_and_name.dart';
import 'package:doc_doc_app/features/onbording/widgets/doctor_image_and_text.dart';
import 'package:doc_doc_app/features/onbording/widgets/get_start_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
          child: Column(
            children: [
              DocLogAndName(),
              SizedBox(
                height: 30.h, 
              ),
              DoctorImageAndText(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(children: [
                  Text(
                    'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                    style: TextStyles.font16Grey,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.h),
                  GetSatrtButton(),
                ]),
              )
            ],
          ),
        )),
      ),
    );
  }
}
