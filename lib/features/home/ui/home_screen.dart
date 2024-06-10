import 'package:doc_doc_app/core/Helpers/spacer_helper.dart';
import 'package:doc_doc_app/features/home/ui/widgets/doctor_blue_container.dart';
import 'package:doc_doc_app/features/home/ui/widgets/doctor_speciality_listview.dart';
import 'package:doc_doc_app/features/home/ui/widgets/doctor_speciality_see_all.dart';
import 'package:doc_doc_app/features/home/ui/widgets/hi_name.dart';
import 'package:doc_doc_app/features/home/ui/widgets/nofication_icon.dart';
import 'package:flutter/material.dart';

import 'widgets/doctor_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          width: double.infinity,
          child: Column(
            children: [
              const Row(
                children: [
                  HiName(),
                  Spacer(),
                  NotificationIcon(),
                ],
              ),
              verticalSpace(18),
              const DoctorBlueContainer(),
              verticalSpace(18),
              const DoctorSpecialitySeeAll(text: 'Doctor Speciality'),
              verticalSpace(18),
              const DoctorSpecialityListView(),
              verticalSpace(18),
              const DoctorSpecialitySeeAll(text: 'Recommendation Doctor'),
              const DoctorListView(),
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Container(
              //         decoration: BoxDecoration(
              //           color: Colors.blue,
              //           borderRadius: BorderRadius.circular(16),
              //         ),
              //         padding: EdgeInsets.all(16),
              //         child: Row(
              //           children: [
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text('Book and schedule with nearest doctor',
              //                       style: TextStyle(
              //                           color: Colors.white, fontSize: 16)),
              //                   SizedBox(height: 5),
              //                   ElevatedButton(
              //                     style: ElevatedButton.styleFrom(
              //                       shape: RoundedRectangleBorder(
              //                         borderRadius: BorderRadius.circular(12),
              //                       ),
              //                     ),
              //                     onPressed: () {},
              //                     child: Text('Find Nearby'),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Image.network('https://via.placeholder.com/100',
              //                 width: 100),
              //           ],
              //         ),
              //       ),
              //       SizedBox(height: 16),
              //       Text('Doctor Speciality',
              //           style: TextStyle(
              //               fontSize: 18, fontWeight: FontWeight.bold)),
              //       SizedBox(height: 5),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text('General'),
              //           Text('Neurologic'),
              //           Text('Pediatric'),
              //           Text('Radiology'),
              //         ],
              //       ),
              //       SizedBox(height: 16),
              //       Text('Recommendation Doctor',
              //           style: TextStyle(
              //               fontSize: 18, fontWeight: FontWeight.bold)),
              //       SizedBox(height: 5),
              //       ListView(
              //         shrinkWrap: true,
              //         physics: NeverScrollableScrollPhysics(),
              //         children: [
              //           ListTile(
              //             leading: Image.network(
              //                 'https://via.placeholder.com/50',
              //                 width: 50),
              //             title: Text('Dr. Randy Wigham'),
              //             subtitle: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text('General | RSUD Gatot Subroto'),
              //                 Row(
              //                   children: [
              //                     Icon(Icons.star,
              //                         color: Colors.yellow, size: 16),
              //                     Text('4.8 (4,279 reviews)'),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //           ListTile(
              //             leading: Image.network(
              //                 'https://via.placeholder.com/50',
              //                 width: 50),
              //             title: Text('Dr. Jason Sullivan'),
              //             subtitle: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text('Radiology | RSUD Gatot Subroto'),
              //                 Row(
              //                   children: [
              //                     Icon(Icons.star,
              //                         color: Colors.yellow, size: 16),
              //                     Text('4.5 (3,214 reviews)'),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
