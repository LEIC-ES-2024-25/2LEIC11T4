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

  /// `Email`
  String get email_hint {
    return Intl.message('Email', name: 'email_hint', desc: '', args: []);
  }

  /// `Password`
  String get password_hint {
    return Intl.message('Password', name: 'password_hint', desc: '', args: []);
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

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
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

  /// `Add up to 5 photos`
  String get add_photo {
    return Intl.message(
      'Add up to 5 photos',
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

  /// `First name`
  String get first_name {
    return Intl.message('First name', name: 'first_name', desc: '', args: []);
  }

  /// `Last name`
  String get last_name {
    return Intl.message('Last name', name: 'last_name', desc: '', args: []);
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `University/College`
  String get university_college {
    return Intl.message(
      'University/College',
      name: 'university_college',
      desc: '',
      args: [],
    );
  }

  /// `Degree`
  String get degree {
    return Intl.message('Degree', name: 'degree', desc: '', args: []);
  }

  /// `Current year of studies`
  String get current_year {
    return Intl.message(
      'Current year of studies',
      name: 'current_year',
      desc: '',
      args: [],
    );
  }

  /// `Send recovery email`
  String get send {
    return Intl.message(
      'Send recovery email',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get not_found {
    return Intl.message(
      'User not found',
      name: 'not_found',
      desc: '',
      args: [],
    );
  }

  /// `Add new option`
  String get add_new {
    return Intl.message('Add new option', name: 'add_new', desc: '', args: []);
  }

  /// `Save profile`
  String get save {
    return Intl.message('Save profile', name: 'save', desc: '', args: []);
  }

  /// `Password changed successfully`
  String get password_changed_successfully {
    return Intl.message(
      'Password changed successfully',
      name: 'password_changed_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Change password failed`
  String get change_password_failed {
    return Intl.message(
      'Change password failed',
      name: 'change_password_failed',
      desc: '',
      args: [],
    );
  }

  /// `Wrong previous password`
  String get wrong_previous_password {
    return Intl.message(
      'Wrong previous password',
      name: 'wrong_previous_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get please_enter_password {
    return Intl.message(
      'Please enter your password',
      name: 'please_enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters long`
  String get password_too_short {
    return Intl.message(
      'Password must be at least 6 characters long',
      name: 'password_too_short',
      desc: '',
      args: [],
    );
  }

  /// `Previous Password`
  String get previous_password {
    return Intl.message(
      'Previous Password',
      name: 'previous_password',
      desc: '',
      args: [],
    );
  }

  /// `Value`
  String get value {
    return Intl.message('Value', name: 'value', desc: '', args: []);
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `ISBN`
  String get isbn {
    return Intl.message('ISBN', name: 'isbn', desc: '', args: []);
  }

  /// `Authors`
  String get authors {
    return Intl.message('Authors', name: 'authors', desc: '', args: []);
  }

  /// `Publishers`
  String get publishers {
    return Intl.message('Publishers', name: 'publishers', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Area of study`
  String get area_of_study {
    return Intl.message(
      'Area of study',
      name: 'area_of_study',
      desc: '',
      args: [],
    );
  }

  /// `Book conditions`
  String get conditions {
    return Intl.message(
      'Book conditions',
      name: 'conditions',
      desc: '',
      args: [],
    );
  }

  /// `Submited successfully`
  String get submited_successfully {
    return Intl.message(
      'Submited successfully',
      name: 'submited_successfully',
      desc: '',
      args: [],
    );
  }

  /// `There was an error`
  String get error_submitting {
    return Intl.message(
      'There was an error',
      name: 'error_submitting',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all fields`
  String get fill_all_fields {
    return Intl.message(
      'Please fill all fields',
      name: 'fill_all_fields',
      desc: '',
      args: [],
    );
  }

  /// `There was an error uploading the image`
  String get image_upload_error {
    return Intl.message(
      'There was an error uploading the image',
      name: 'image_upload_error',
      desc: '',
      args: [],
    );
  }

  /// `Invalid condition`
  String get invalid_condition {
    return Intl.message(
      'Invalid condition',
      name: 'invalid_condition',
      desc: '',
      args: [],
    );
  }

  /// `Book about algorithms, 2nd edition`
  String get description_hint {
    return Intl.message(
      'Book about algorithms, 2nd edition',
      name: 'description_hint',
      desc: '',
      args: [],
    );
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
