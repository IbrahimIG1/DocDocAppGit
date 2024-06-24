import 'package:doc_doc_app/core/Helpers/spacer_helper.dart';
import 'package:doc_doc_app/features/home/ui/widgets/bloc_builder_specialization_and_doctor.dart';
import 'package:doc_doc_app/features/home/ui/widgets/doctor_blue_container.dart';
import 'package:doc_doc_app/features/home/ui/widgets/doctor_speciality_see_all.dart';
import 'package:doc_doc_app/features/home/ui/widgets/hi_name.dart';
import 'package:doc_doc_app/features/home/ui/widgets/nofication_icon.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
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
                const BlocBuilderSpecializationAndDoctor(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
