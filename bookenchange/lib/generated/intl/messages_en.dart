// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "already_in_use": MessageLookupByLibrary.simpleMessage(
      "Email in use already",
    ),
    "appName": MessageLookupByLibrary.simpleMessage("BookDonation"),
    "chat": MessageLookupByLibrary.simpleMessage("Chat"),
    "email_hint": MessageLookupByLibrary.simpleMessage(""),
    "forgot_password": MessageLookupByLibrary.simpleMessage(
      "Forgot Password ?",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "new_contribution": MessageLookupByLibrary.simpleMessage(
      "New Contribution",
    ),
    "password_hint": MessageLookupByLibrary.simpleMessage(""),
    "previous_contributions": MessageLookupByLibrary.simpleMessage(
      "Previous Contributions",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "remember": MessageLookupByLibrary.simpleMessage("Remember me"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "sign_in": MessageLookupByLibrary.simpleMessage("Sign in"),
    "sign_in_successful": MessageLookupByLibrary.simpleMessage(
      "Sign in successfully",
    ),
    "sign_in_unsuccesful": MessageLookupByLibrary.simpleMessage(
      "Sign in failed",
    ),
    "sign_up": MessageLookupByLibrary.simpleMessage("Sign up"),
    "sign_up_successful": MessageLookupByLibrary.simpleMessage(
      "Sign in successfully",
    ),
    "sign_up_unsuccesful": MessageLookupByLibrary.simpleMessage(
      "Sign in failed",
    ),
    "weak_password": MessageLookupByLibrary.simpleMessage("Weak password"),
  };
}
