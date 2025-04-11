// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `BookDonation`
  String get appName {
    return Intl.message('BookDonation', name: 'appName', desc: '', args: []);
  }

  /// `Chat`
  String get chat {
    return Intl.message('Chat', name: 'chat', desc: '', args: []);
  }

  /// `New Contribution`
  String get new_contribution {
    return Intl.message(
      'New Contribution',
      name: 'new_contribution',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Previous Contributions`
  String get previous_contributions {
    return Intl.message(
      'Previous Contributions',
      name: 'previous_contributions',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// ``
  String get email_hint {
    return Intl.message('', name: 'email_hint', desc: '', args: []);
  }

  /// ``
  String get password_hint {
    return Intl.message('', name: 'password_hint', desc: '', args: []);
  }

  /// `Forgot Password ?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password ?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get sign_in {
    return Intl.message('Sign in', name: 'sign_in', desc: '', args: []);
  }

  /// `Sign up`
  String get sign_up {
    return Intl.message('Sign up', name: 'sign_up', desc: '', args: []);
  }

  /// `Remember me`
  String get remember {
    return Intl.message('Remember me', name: 'remember', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Sign in successfully`
  String get sign_in_successful {
    return Intl.message(
      'Sign in successfully',
      name: 'sign_in_successful',
      desc: '',
      args: [],
    );
  }

  /// `Sign in failed`
  String get sign_in_unsuccesful {
    return Intl.message(
      'Sign in failed',
      name: 'sign_in_unsuccesful',
      desc: '',
      args: [],
    );
  }

  /// `Sign in successfully`
  String get sign_up_successful {
    return Intl.message(
      'Sign in successfully',
      name: 'sign_up_successful',
      desc: '',
      args: [],
    );
  }

  /// `Sign in failed`
  String get sign_up_unsuccesful {
    return Intl.message(
      'Sign in failed',
      name: 'sign_up_unsuccesful',
      desc: '',
      args: [],
    );
  }

  /// `Weak password`
  String get weak_password {
    return Intl.message(
      'Weak password',
      name: 'weak_password',
      desc: '',
      args: [],
    );
  }

  /// `Email in use already`
  String get already_in_use {
    return Intl.message(
      'Email in use already',
      name: 'already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `Add up to 3 photos`
  String get add_photo {
    return Intl.message(
      'Add up to 3 photos',
      name: 'add_photo',
      desc: '',
      args: [],
    );
  }

  /// `Add photos`
  String get photo {
    return Intl.message('Add photos', name: 'photo', desc: '', args: []);
  }

  /// `Field can't be null`
  String get not_null {
    return Intl.message(
      'Field can\'t be null',
      name: 'not_null',
      desc: '',
      args: [],
    );
  }

  /// `Book Tittle`
  String get book_tittle {
    return Intl.message('Book Tittle', name: 'book_tittle', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
