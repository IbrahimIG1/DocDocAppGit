import 'package:doc_doc_app/core/Helpers/spacer_helper.dart';
import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorListView extends StatelessWidget {
  const DoctorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://img.freepik.com/free-photo/handsome-man-holding-something_1368-836.jpg?w=360&t=st=1718036990~exp=1718037590~hmac=4de4558795610276bb7fe356bdb0ccd13cee1366d102b0806cfe7da7cfe66430',
                    width: 110.w,
                    height: 120.h,
                    fit: BoxFit.fill,
                  ),
                ),
                horizontalSpace(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr.Randy Wigham',
                      style: TextStyles.font18GreyDarkSemiBold,
                    ),
                    verticalSpace(5),
                    Text(
                      'General | RSUD Gatot Subroto',
                      style: TextStyles.font12GreyLightBold,
                    ),
                    verticalSpace(5),
                    verticalSpace(5),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        Text(
                          '4.8 (4,279 reviews)',
                          style: TextStyles.font12GreyLightBold,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
