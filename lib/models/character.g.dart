// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterRequest _$CharacterRequestFromJson(Map<String, dynamic> json) {
  return CharacterRequest(
    Character.fromJson(json['characterObj'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CharacterRequestToJson(CharacterRequest instance) =>
    <String, dynamic>{
      'characterObj': instance.character,
    };

Character _$CharacterFromJson(Map<String, dynamic> json) {
  return Character(
    json['Id'] as String,
    json['name'] as String,
    json['money'] as int,
    json['experience'] as int,
    json['userId'] as String,
  );
}

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'Id': instance.id,
      'name': instance.name,
      'money': instance.money,
      'experience': instance.exp,
      'userId': instance.userId,
    };
