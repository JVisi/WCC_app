import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wccapp/config/core.dart';
import 'package:wccapp/models/badRequest.dart';
import 'package:wccapp/models/user.dart';

class RequestLogin{
  final String email;
  final String password;
  final bool keepLogin;

  RequestLogin({this.email, this.password, this.keepLogin});

  Future<User> send() async {
    String body = jsonEncode({"email": this.email, "password": this.password});
    final response =
        await http.post(WebConfig.url + "/login", headers: WebConfig.headers, body: body);
    try {
      AuthRequest log = AuthRequest.fromJson(jsonDecode(response.body));
      print(response.body);
      if (this.keepLogin) {
        await saveLoginData(this.email,this.password);
      }
      return log.user;
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
