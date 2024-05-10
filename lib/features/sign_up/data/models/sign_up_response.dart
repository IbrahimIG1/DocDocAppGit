import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  String message;
  @JsonKey(name:'data')
  UserData? userData;
  String status;
  String code;
  SignUpResponse({
    required this.message,
    required this.userData,
    required this.status,
    required this.code,
  });
  factory SignUpResponse.fromJson(Map<String, dynamic> json) => _$SignUpResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  String token;
  @JsonKey(name: 'username')
  String userName;
  UserData({required this.token, required this.userName});
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
