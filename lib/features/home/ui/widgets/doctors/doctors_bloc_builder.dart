import 'package:doc_doc_app/features/home/data/models/specializations_response_model.dart';
import 'package:doc_doc_app/features/home/logic/home_cubit.dart';
import 'package:doc_doc_app/features/home/logic/home_state.dart';
import 'package:doc_doc_app/features/home/ui/widgets/doctors/doctor_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is DoctorsSuccess || current is DoctorsError,
      builder: (context, state) {
        return state.maybeWhen(
          doctorsSuccess: (doctorsList) {
            return setUpSuccess(doctorsList);
          },
          doctorsError: (error) => setUpError(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  setUpSuccess(List<Doctors?>? doctorsList) {
    return DoctorListView(doctorsList: doctorsList);
  }

  setUpError() {
    return const SizedBox.shrink();
  }
}
