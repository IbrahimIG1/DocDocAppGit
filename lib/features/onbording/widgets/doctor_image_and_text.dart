import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/onbording_background.png'),
        Container(
            foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [.14, .4],
            )),
            child: Image.asset(
              'assets/images/onbording_doctor.png',
            )),
        Positioned(
          bottom: 30.h,
          left: 0,
          right: 0,
          child: Text(
            'Best Doctor \nAppointment App',
            textAlign: TextAlign.center,
            style: TextStyles.font32BlueBold.copyWith(height: 1.4),
          ),
        ),
      ],
    );
  }
}
