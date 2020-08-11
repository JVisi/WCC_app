import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(nullable: false)
class AuthRequest{
  @JsonKey(nullable:false)
  final User user;

  AuthRequest({this.user});

  factory AuthRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable(nullable: false)
class User{
  @JsonKey(nullable: false,name: 'Id')
  final String id;
  @JsonKey(nullable: false)
  final String email;
  @JsonKey(ignore: true)
  final String password;
  @JsonKey(nullable: true)
  final int rightLevel;
  User({this.id,this.email,this.password,this.rightLevel});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}