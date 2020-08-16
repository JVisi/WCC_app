import 'package:json_annotation/json_annotation.dart';
part 'character.g.dart';

@JsonSerializable(nullable: false)
class CharacterRequest{
  @JsonKey(nullable: false,name: "characterObj")
  final Character character;

  CharacterRequest(this.character);

  factory CharacterRequest.fromJson(Map<String, dynamic> json) => _$CharacterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterRequestToJson(this);
}
@JsonSerializable(nullable:false)
class Character{

  @JsonKey(nullable: false,name: 'Id')
  final String id;
  @JsonKey(nullable: false)
  final String name;
  @JsonKey(nullable: false)
  final int money;
  @JsonKey(nullable: false, name: "experience")
  final int exp;
  @JsonKey(nullable: false)
  final String userId;

  Character(this.id, this.name, this.money, this.exp, this.userId);


  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}