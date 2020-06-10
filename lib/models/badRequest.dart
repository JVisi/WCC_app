import 'package:json_annotation/json_annotation.dart';
part 'badRequest.g.dart';

@JsonSerializable(nullable: false)
class BadRequest{
  final String message;

  BadRequest({this.message});

  factory BadRequest.fromJson(Map<String, dynamic> json) => _$BadRequestFromJson(json);
  Map<String, dynamic> toJson() => _$BadRequestToJson(this);
}