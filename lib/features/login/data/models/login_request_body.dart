import 'package:json_annotation/json_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  String email;
  String password;

  LoginRequestBody({required this.email, required this.password});
  Map<String, dynamic> tojson() => _$LoginRequestBodyToJson(this);

  // Map<String, dynamic> toJson() => {
  //       'email': email,
  //       'password': password,
  //     };
}
