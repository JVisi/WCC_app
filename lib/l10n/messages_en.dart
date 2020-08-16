// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "characterNameError" : MessageLookupByLibrary.simpleMessage("This name is already in use"),
    "createCharacter" : MessageLookupByLibrary.simpleMessage("Name your character"),
    "createCharacterBtn" : MessageLookupByLibrary.simpleMessage("Create"),
    "createCharacterTitle" : MessageLookupByLibrary.simpleMessage("Name and Create your character!"),
    "dontHaveAccount" : MessageLookupByLibrary.simpleMessage("Don\'t have an account? Sign up here!"),
    "email" : MessageLookupByLibrary.simpleMessage("Email"),
    "haveAccount" : MessageLookupByLibrary.simpleMessage("Already have an account? Sign in here!"),
    "loading" : MessageLookupByLibrary.simpleMessage("Loading..."),
    "loginButton" : MessageLookupByLibrary.simpleMessage("Login"),
    "loginError" : MessageLookupByLibrary.simpleMessage("Wrong username or password"),
    "password" : MessageLookupByLibrary.simpleMessage("Password"),
    "registerButton" : MessageLookupByLibrary.simpleMessage("Register"),
    "reload" : MessageLookupByLibrary.simpleMessage("Reload"),
    "saveLoginData" : MessageLookupByLibrary.simpleMessage("Save login data"),
    "serverError" : MessageLookupByLibrary.simpleMessage("Can\'t reach the server. Check your internet connection"),
    "unknownError" : MessageLookupByLibrary.simpleMessage("An unknown error occurred")
  };
}
