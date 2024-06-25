import 'package:doc_doc_app/features/home/data/models/specializations_response_model.dart';
import 'package:doc_doc_app/features/home/ui/widgets/doctors/doctors_list_view_item.dart';
import 'package:flutter/material.dart';

class DoctorListView extends StatelessWidget {
  final List<Doctors?>? doctorsList;
  const DoctorListView({super.key, required this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList?.length,
        itemBuilder: (context, index) {
          return DoctorsListViewItem(
              itemIndex: index, doctorsModel: doctorsList?[index]);
        },
      ),
    );
  }
}
