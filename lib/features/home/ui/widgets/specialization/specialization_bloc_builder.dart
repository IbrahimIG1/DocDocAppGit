import 'package:doc_doc_app/core/Helpers/spacer_helper.dart';
import 'package:doc_doc_app/features/home/logic/home_cubit.dart';
import 'package:doc_doc_app/features/home/logic/home_state.dart';
import 'package:doc_doc_app/features/home/ui/widgets/specialization/speciality_list_view.dart';
import 'package:doc_doc_app/features/home/ui/widgets/specialization/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../doctors/doctors_shimmer_loading.dart';

class SpecializationBlocBuilder extends StatelessWidget {
  const SpecializationBlocBuilder({super.key});

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
          specializationSuccess: (specializationDataList) {
            return setupSuccess(specializationDataList);
          },
          specializationError: (errorHandler) => setupError(),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupLoading() {
    return Expanded(
      child: Column(
        children: [
          SpecialityShimmerLoading(),
          verticalSpace(8),
          DoctorsShimmerLoading(),
        ],
      ),
    );
  }

  Widget setupSuccess(specializationDatalist) => SpecialityListView(
        specializationDatalist: specializationDatalist ?? [],
      );
  Widget setupError() => SizedBox.shrink();
}
