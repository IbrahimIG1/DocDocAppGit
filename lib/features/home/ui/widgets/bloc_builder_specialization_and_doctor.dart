import 'package:doc_doc_app/core/Helpers/spacer_helper.dart';
import 'package:doc_doc_app/features/home/logic/home_cubit.dart';
import 'package:doc_doc_app/features/home/logic/home_state.dart';
import 'package:doc_doc_app/features/home/ui/widgets/doctor_listview.dart';
import 'package:doc_doc_app/features/home/ui/widgets/doctor_speciality_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBuilderSpecializationAndDoctor extends StatelessWidget {
  const BlocBuilderSpecializationAndDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationLoading ||
          current is SpecializationSuccess ||
          current is SpecializationError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationLoading: () => setupLoading(),
          specializationSuccess: (specializationResponseModel) {
            var specializationDatalist =
                specializationResponseModel.specializationDataList;

            return setupSuccess(specializationDatalist);
          },
          specializationError: (errorHandler) => setupError(),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupLoading() => const SizedBox(
        height: 100,
        child: Center(child: CircularProgressIndicator()),
      );

  Widget setupSuccess(specializationDatalist) => Expanded(
        child: Column(children: [
          DoctorSpecialityListView(
            specializationDatalist: specializationDatalist ?? [],
          ),
          verticalSpace(18),
          DoctorListView(doctorsList: specializationDatalist?[0]?.doctorsList),
        ]),
      );
  Widget setupError() => SizedBox.shrink();
}
