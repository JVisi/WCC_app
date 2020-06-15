import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:wccapp/config/core.dart';
import 'package:wccapp/config/loader.dart';
import 'package:wccapp/config/model.dart';
import 'package:wccapp/models/badRequest.dart';
import 'package:wccapp/models/user.dart';
import 'package:scoped_model/scoped_model.dart';

class RequestLogin<T> extends Model {
  final String email;
  final String password;
  final bool keepLogin;

  RequestLogin({this.email, this.password, this.keepLogin});

  Future<User> send() async {
    Map<String, String> headers = {
      "authorization": WebConfig.authKey,
      "Content-type": "application/json"
    };
    String body = jsonEncode({"email": this.email, "password": this.password});
    final response =
        await http.post(WebConfig.url + "/login", headers: headers, body: body);
    try {
      LoginRequest log = LoginRequest.fromJson(jsonDecode(response.body));
      print(response.body);
      if (this.keepLogin) {
        await saveLoginData();
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

  saveLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', this.email);
    await prefs.setString('password', this.password);
  }
}
