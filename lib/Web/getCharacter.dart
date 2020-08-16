import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wccapp/config/core.dart';

import 'package:wccapp/models/character.dart';

class GetCharacter{
  final String userId;
  GetCharacter(this.userId);

  Future<Character> send() async {
    Map<String,String> body = {"id":this.userId};
    final uri=Uri.http("192.168.1.68:3000", "/getCharacter",body);
    final response = await http.get(uri,headers:WebConfig.headers);
    try{
      CharacterRequest char=CharacterRequest.fromJson(jsonDecode(response.body));
      return char.character;
    }
    catch(e){
      return Future.error(e);
    }

  }
}