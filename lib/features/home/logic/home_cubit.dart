import 'package:doc_doc_app/core/Helpers/extensions.dart';
import 'package:doc_doc_app/core/networking/api_error_handler.dart';
import 'package:doc_doc_app/features/home/data/models/specializations_response_model.dart';
import 'package:doc_doc_app/features/home/data/repos/home_repo.dart';
import 'package:doc_doc_app/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?>? specializationDataList = [];
  getspecialization() async {
    emit(HomeState.specializationLoading());
    final response = await _homeRepo.getSpecialization();

    response.when(success: (specializationsResponseModel) {
      specializationDataList =
          specializationsResponseModel.specializationDataList ?? [];

      getDoctorsList(specializationId: specializationDataList?.first?.id);
      emit(HomeState.specializationSuccess(specializationDataList));
    }, failure: (errorHandler) {
      HomeState.specializationError(errorHandler);
    });
  }

  getDoctorsList({required int? specializationId}) {
    List<Doctors?>? doctorsList =
        getDoctorsListBySpecializationsId(specializationId!);
    if (!doctorsList.isListNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      HomeState.doctorsError(
          ErrorHandler.handle("Error in getDoctorsList => No doctors found"));
    }
  }

  /// returns the list of doctors based on the specialization id (Filter specialization list and give my doctors for every specialization)
  getDoctorsListBySpecializationsId(specializationId) {
    return specializationDataList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
