import 'package:cached_network_image/cached_network_image.dart';
import 'package:doc_doc_app/core/Helpers/spacer_helper.dart';
import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:doc_doc_app/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListViewItem extends StatelessWidget {
  final int itemIndex;
  final Doctors? doctorsModel;
  const DoctorsListViewItem(
      {super.key, required this.itemIndex, required this.doctorsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          CachedNetworkImage(
            width: 110.w,
            height: 120.h,
            imageUrl:
                "https://img.freepik.com/free-photo/handsome-man-holding-something_1368-836.jpg?w=360&t=st=1718036990~exp=1718037590~hmac=4de4558795610276bb7fe356bdb0ccd13cee1366d102b0806cfe7da7cfe66430",
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(12),
          //   child: Image.network(
          //     doctorsModel?.photo ?? "https://img.freepik.com/free-photo/handsome-man-holding-something_1368-836.jpg?w=360&t=st=1718036990~exp=1718037590~hmac=4de4558795610276bb7fe356bdb0ccd13cee1366d102b0806cfe7da7cfe66430",
          //     width: 110.w,
          //     height: 120.h,
          //     fit: BoxFit.fill,
          //   ),
          // ),
          horizontalSpace(15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorsModel?.name ?? "doctor name",
                  style: TextStyles.font18GreyDarkSemiBold,
                ),
                verticalSpace(5),
                Text(
                  "${doctorsModel?.degree ?? "doctor degree"} | ${doctorsModel?.phone ?? "doctor phone"}",
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
          ),
        ],
      ),
    );
  }
}
