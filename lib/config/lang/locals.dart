import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wccapp/l10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String localName = Intl.canonicalizedLocale(
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString());

    return initializeMessages(localName).then((bool _) {
      Intl.defaultLocale = localName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  String get loading {
    return Intl.message("Loading...",
        name: "loading", desc: "The text on the loading");
  }

  String get reload {
    return Intl.message("Reload",
        name: "reload", desc: "The text on reloading");
  }

  String get loginError {
    return Intl.message("Wrong username or password",
        name: "loginError",
        desc: "The text when password or username is not correct");
  }

  String get serverError {
    return Intl.message(
        "Can't reach the server. Check your internet connection",
        name: "serverError",
        desc: "The text when the app can't reach the server");
  }

  String get saveLoginData {
    return Intl.message(
        "Save login data",
        name: "saveLoginData",
        desc: "The text when the app can't reach the server");
  }
  String get havingAccount {
    return Intl.message(
        "Already have an account? Sign in here!",
        name: "havingAccount",
        desc: "The text when the app can't reach the server");
  }
  String get dontHaveAccount {
    return Intl.message(
        "Don't have an account? Sign up here!",
        name: "dontHaveAccount",
        desc: "The text when the app can't reach the server");
  }

  String get loginButton {
    return Intl.message(
        "Login",
        name: "loginButton",
        desc: "The text when the app can't reach the server");
  }
  String get registerButton {
    return Intl.message(
        "Register",
        name: "registerButton",
        desc: "The text when the app can't reach the server");
  }



  String get email {
    return Intl.message(
        "Email",
        name: "email",
        desc: "The text when the app can't reach the server");
  }
  String get password {
    return Intl.message(
        "Password",
        name: "password",
        desc: "The text when the app can't reach the server");
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) => ['hu', 'en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
