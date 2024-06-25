import 'package:cached_network_image/cached_network_image.dart';
import 'package:doc_doc_app/core/Helpers/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DoctorsShimmerLoading extends StatelessWidget {
  const DoctorsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            child: Row(
              children: [
                CachedNetworkImage(
                  width: 110.w,
                  height: 120.h,
                  imageUrl:
                      "https://img.freepik.com/free-photo/handsome-man-holding-something_1368-836.jpg?w=360&t=st=1718036990~exp=1718037590~hmac=4de4558795610276bb7fe356bdb0ccd13cee1366d102b0806cfe7da7cfe66430",
                  progressIndicatorBuilder: (context, url, progress) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                          width: 110.w,
                          height: 120.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              shape: BoxShape.rectangle)),
                    );
                  },
                  imageBuilder: (context, imageProvider) {
                    return Container(
                        width: 110.w,
                        height: 120.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover)));
                  },
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                horizontalSpace(15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: 110.w,
                          height: 18.h,
                          decoration: BoxDecoration(
                            // shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      verticalSpace(5),
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: 112.w,
                          height: 18.h,
                          decoration: BoxDecoration(
                            // shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      verticalSpace(5),
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              width: 112.w,
                              height: 18.h,
                              decoration: BoxDecoration(
                                // shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
