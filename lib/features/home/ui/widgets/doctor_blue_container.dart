import 'package:doc_doc_app/core/Helpers/spacer_helper.dart';
import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorBlueContainer extends StatelessWidget {
  const DoctorBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            height: 165.h,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/home_blue_pattern.png')),
                color: Colors.blue,
                borderRadius: BorderRadius.circular(24.w)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      'Book and\nschedule with\nnearest doctor',
                      style: TextStyles.font20WhiteMeduim,
                      textAlign: TextAlign.start,
                    ),
                    verticalSpace(16),
                    findNearbyButton(),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              top: 0,
              right: 16,
              height: 197.h,
              child: Image.asset('assets/images/doctor_container_image.png')),
        ],
      ),
    );
  }

  Expanded findNearbyButton() => Expanded(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48)),
              // tapTargetSize: MaterialTapTargetSize.shrinkWrap
            ),
            onPressed: () {},
            child: Text(
              'Find Nearby',
              style: TextStyles.font12BlueRegular,
            )),
      );
}
