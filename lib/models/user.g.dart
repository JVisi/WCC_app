// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return LoginRequest(
    user: User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['Id'] as String,
    email: json['email'] as String,
    rightLevel: json['rightLevel'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'Id': instance.id,
      'email': instance.email,
      'rightLevel': instance.rightLevel,
    };