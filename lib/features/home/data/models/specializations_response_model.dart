// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'specializations_response_model.g.dart';

@JsonSerializable()
class SpecializationResponseModel {
  @JsonKey(name: 'data')
  List<SpecializationData>? specializationDataList;
  SpecializationResponseModel(
    this.specializationDataList,
  );
  factory SpecializationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationResponseModelFromJson(json);
}

@JsonSerializable()
class SpecializationData {
  int? id;
  String? name;
  @JsonKey(name: 'doctors')
  List<Doctors>? doctorsList;
  SpecializationData({this.doctorsList, this.id, this.name});
  factory SpecializationData.fromJson(Map<String, dynamic> json) =>
      _$SpecializationDataFromJson(json);
}

@JsonSerializable()
class Doctors {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? adress;
  String? degree;
  Doctors({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.adress,
    this.degree,
  });
  factory Doctors.fromJson(Map<String, dynamic> json) =>
      _$DoctorsFromJson(json);
}
