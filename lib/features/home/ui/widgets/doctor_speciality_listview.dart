import 'package:doc_doc_app/features/home/data/models/specializations_response_model.dart';
import 'package:doc_doc_app/features/home/ui/widgets/doctor_specialization_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListView extends StatelessWidget {
  final List<SpecializationsData?> specializationDatalist;
  const DoctorSpecialityListView(
      {super.key, required this.specializationDatalist});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: specializationDatalist.length,
        itemBuilder: (context, index) {
          return DoctorSpecializationItem(
            index: index,
            specializationDatalist: specializationDatalist[index],
          );
        },
      ),
    );
  }
}
