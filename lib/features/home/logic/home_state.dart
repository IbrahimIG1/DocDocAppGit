import 'package:doc_doc_app/core/networking/api_error_handler.dart';
import 'package:doc_doc_app/features/home/data/models/specializations_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.specializationLoading() = SpecializationLoading;
  const factory HomeState.specializationSuccess(SpecializationsResponseModel specializationResponseModel) = SpecializationSuccess;
  const factory HomeState.specializationError(ErrorHandler errorHandler) = SpecializationError;
}
