import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wccapp/Character/createCharacter.dart';
import 'package:wccapp/userAuth/login.dart';
import 'package:wccapp/userAuth/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

final routes = {
  '/loginPage': (context) => LoginScreen(),
  '/registerPage': (context) => RegisterScreen(),
  '/createCharacterPage': (context) => CreateCharacter(),
};

saveLoginData(email, password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('email', email);
  await prefs.setString('password', password);
}

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}

class WebConfig {
  static String url = "http://192.168.1.68:3000";
  static String authKey = "zseni";
  static Map<String, String> headers = {
    "authorization": WebConfig.authKey,
    "Content-type": "application/json"
  };
}

ThemeData themeConfig() => ThemeData(
    iconTheme: IconThemeData(size: SizeConfig.blockSizeVertical * 7),
    textTheme: TextTheme(
        bodyText2: TextStyle(fontSize: SizeConfig.blockSizeVertical * 5, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: SizeConfig.blockSizeVertical * 2.5)));
