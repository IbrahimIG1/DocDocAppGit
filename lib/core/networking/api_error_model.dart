//  This class To Handel All Error Will come from Api


import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';


@JsonSerializable()
class ApiErrorModel {
  String? message;
  int? code;
  ApiErrorModel({this.code, this.message});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);
  /*
  this code auto Generte this code in another file to easy code for me
    {
      message : "message" ,
      code : "code",
    }
  */

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
  /*
  this code auto Generte this code in another file to easy code for me
    {
      "message" : message,
      "code" : code,
    }
  */
}
