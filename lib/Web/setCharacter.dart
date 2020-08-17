import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wccapp/config/core.dart';
import 'package:wccapp/models/badRequest.dart';
import 'package:wccapp/models/character.dart';

class SetCharacter{
  final String name;
  final String id;

  SetCharacter(this.name,this.id);

  Future<Character> send() async {
    String body = jsonEncode({"name": this.name, "id": this.id});
    final response =
    await http.post(WebConfig.url + "/setCharacter", headers: WebConfig.headers, body: body);
    try {
      CharacterRequest log = CharacterRequest.fromJson(jsonDecode(response.body));
      return log.character;
    } catch (e) {
      try{
        BadRequest br=BadRequest.fromJson(jsonDecode(response.body));
        return Future.error(br.message);
      }catch(err){
        return Future.error(err);
      }
    }
  }

}
