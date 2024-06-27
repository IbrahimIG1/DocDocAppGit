import 'package:cached_network_image/cached_network_image.dart';
import 'package:doc_doc_app/core/Helpers/spacer_helper.dart';
import 'package:doc_doc_app/core/theming/text_style.dart';
import 'package:doc_doc_app/features/home/data/models/specializations_response_model.dart';
import 'package:doc_doc_app/features/home/logic/home_cubit.dart';
import 'package:doc_doc_app/features/home/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListViewItem extends StatefulWidget {
  final int itemIndex;
  final Doctors? doctorsModel;
  const DoctorsListViewItem(
      {super.key, required this.itemIndex, required this.doctorsModel});

  @override
  State<DoctorsListViewItem> createState() => _DoctorsListViewItemState();
}

class _DoctorsListViewItemState extends State<DoctorsListViewItem> {
  // bool _isStart = true;
  // bool _isAnimate = false;
  // @override
  // void initState() {
  //   super.initState();
  //   if (_isStart) {
  //     Future.delayed(Duration(milliseconds: widget.itemIndex * 50), () {
  //       setState(() {
  //         _isAnimate = true;
  //         _isStart = false;
  //       });
  //     });
  //   } else {
  //     _isAnimate = true;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var homecubit = HomeCubit.get(context);
        return AnimatedOpacity(
          
          duration: Duration(milliseconds: homecubit.isAnimate ? 1000 : 0),
          opacity: homecubit.isAnimate ? 1 : 0,
          child: AnimatedPadding(
            duration: Duration(milliseconds:homecubit.isAnimate ? 1000 :0),
            padding:
                homecubit.isAnimate ? EdgeInsets.all(4) : EdgeInsets.all(10),
            child: Container(
              margin: EdgeInsets.only(bottom: 16.h),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  CachedNetworkImage(
                    width: 110.w,
                    height: 120.h,
                    imageUrl:
                        "https://img.freepik.com/free-photo/handsome-man-holding-something_1368-836.jpg?w=360&t=st=1718036990~exp=1718037590~hmac=4de4558795610276bb7fe356bdb0ccd13cee1366d102b0806cfe7da7cfe66430",
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
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
                          widget.doctorsModel?.name ?? "doctor name",
                          style: TextStyles.font18GreyDarkSemiBold,
                        ),
                        verticalSpace(5),
                        Text(
                          "${widget.doctorsModel?.degree ?? "doctor degree"} | ${widget.doctorsModel?.phone ?? "doctor phone"}",
                          style: TextStyles.font12GreyLightBold,
                        ),
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
            ),
          ),
        );
      },
    );
  }
}
