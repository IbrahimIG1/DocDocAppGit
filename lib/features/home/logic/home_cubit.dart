import 'package:doc_doc_app/features/home/data/repos/home_repo.dart';
import 'package:doc_doc_app/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  getspecialization() async {
    emit(HomeState.specializationLoading());
    final response = await _homeRepo.getSpecialization();
    response.when(success: (specializationResponseModel) {
      emit(HomeState.specializationSuccess(specializationResponseModel));
    }, failure: (errorHandler) {
      HomeState.specializationError(errorHandler);
    });
  }
}
