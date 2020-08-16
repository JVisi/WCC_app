// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a hu locale. All the
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
  String get localeName => 'hu';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "characterNameError" : MessageLookupByLibrary.simpleMessage("Ez a név már használatban van"),
    "createCharacter" : MessageLookupByLibrary.simpleMessage("A karaktered neve"),
    "createCharacterBtn" : MessageLookupByLibrary.simpleMessage("Létrehoz"),
    "createCharacterTitle" : MessageLookupByLibrary.simpleMessage("Nevezd el és hozd létre a karaktered!"),
    "dontHaveAccount" : MessageLookupByLibrary.simpleMessage("Még nincs fiókja? Készítsen egyet itt!"),
    "email" : MessageLookupByLibrary.simpleMessage("Email"),
    "haveAccount" : MessageLookupByLibrary.simpleMessage("Már van fiókja? Jelentkezzen be!"),
    "loading" : MessageLookupByLibrary.simpleMessage("Töltés..."),
    "loginButton" : MessageLookupByLibrary.simpleMessage("Bejelentkezés"),
    "loginError" : MessageLookupByLibrary.simpleMessage("Hibás email-cím vagy jelszó"),
    "password" : MessageLookupByLibrary.simpleMessage("Jelszó"),
    "registerButton" : MessageLookupByLibrary.simpleMessage("Regisztráció"),
    "reload" : MessageLookupByLibrary.simpleMessage("Újratölt"),
    "saveLoginData" : MessageLookupByLibrary.simpleMessage("Adatok mentése?"),
    "serverError" : MessageLookupByLibrary.simpleMessage("A szerver nem elérhető. Ellenőrizd az internetkapcsolatot"),
    "unknownError" : MessageLookupByLibrary.simpleMessage("Ismeretlen hiba történt.")
  };
}
