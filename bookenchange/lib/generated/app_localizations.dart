import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'BookDonation'**
  String get appName;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @new_contribution.
  ///
  /// In en, this message translates to:
  /// **'New Contribution'**
  String get new_contribution;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @previous_contributions.
  ///
  /// In en, this message translates to:
  /// **'Previous Contributions'**
  String get previous_contributions;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email_hint.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email_hint;

  /// No description provided for @password_hint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password_hint;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password ?'**
  String get forgot_password;

  /// No description provided for @change_password.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get change_password;

  /// No description provided for @sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get sign_in;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get sign_up;

  /// No description provided for @remember.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get remember;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @sign_in_successful.
  ///
  /// In en, this message translates to:
  /// **'Sign in successfully'**
  String get sign_in_successful;

  /// No description provided for @sign_in_unsuccesful.
  ///
  /// In en, this message translates to:
  /// **'Sign in failed'**
  String get sign_in_unsuccesful;

  /// No description provided for @sign_up_successful.
  ///
  /// In en, this message translates to:
  /// **'Sign in successfully'**
  String get sign_up_successful;

  /// No description provided for @sign_up_unsuccesful.
  ///
  /// In en, this message translates to:
  /// **'Sign in failed'**
  String get sign_up_unsuccesful;

  /// No description provided for @weak_password.
  ///
  /// In en, this message translates to:
  /// **'Weak password'**
  String get weak_password;

  /// No description provided for @already_in_use.
  ///
  /// In en, this message translates to:
  /// **'Email in use already'**
  String get already_in_use;

  /// No description provided for @add_photo.
  ///
  /// In en, this message translates to:
  /// **'Add up to 5 photos'**
  String get add_photo;

  /// No description provided for @photo.
  ///
  /// In en, this message translates to:
  /// **'Add photos'**
  String get photo;

  /// No description provided for @not_null.
  ///
  /// In en, this message translates to:
  /// **'Field can\'t be null'**
  String get not_null;

  /// No description provided for @book_tittle.
  ///
  /// In en, this message translates to:
  /// **'Book Tittle'**
  String get book_tittle;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @first_name.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get first_name;

  /// No description provided for @last_name.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get last_name;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @university_college.
  ///
  /// In en, this message translates to:
  /// **'University/College'**
  String get university_college;

  /// No description provided for @degree.
  ///
  /// In en, this message translates to:
  /// **'Degree'**
  String get degree;

  /// No description provided for @current_year.
  ///
  /// In en, this message translates to:
  /// **'Current year of studies'**
  String get current_year;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send recovery email'**
  String get send;

  /// No description provided for @not_found.
  ///
  /// In en, this message translates to:
  /// **'User not found'**
  String get not_found;

  /// No description provided for @add_new.
  ///
  /// In en, this message translates to:
  /// **'Add new option'**
  String get add_new;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save profile'**
  String get save;

  /// No description provided for @delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get delete_account;

  /// No description provided for @password_changed_successfully.
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully'**
  String get password_changed_successfully;

  /// No description provided for @change_password_failed.
  ///
  /// In en, this message translates to:
  /// **'Change password failed'**
  String get change_password_failed;

  /// No description provided for @wrong_previous_password.
  ///
  /// In en, this message translates to:
  /// **'Wrong current password'**
  String get wrong_previous_password;

  /// No description provided for @please_enter_password.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get please_enter_password;

  /// No description provided for @password_too_short.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters long'**
  String get password_too_short;

  /// No description provided for @previous_password.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get previous_password;

  /// No description provided for @value.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get value;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get new_password;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @isbn.
  ///
  /// In en, this message translates to:
  /// **'ISBN'**
  String get isbn;

  /// No description provided for @authors.
  ///
  /// In en, this message translates to:
  /// **'Authors'**
  String get authors;

  /// No description provided for @publishers.
  ///
  /// In en, this message translates to:
  /// **'Publishers'**
  String get publishers;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @area_of_study.
  ///
  /// In en, this message translates to:
  /// **'Area of study'**
  String get area_of_study;

  /// No description provided for @conditions.
  ///
  /// In en, this message translates to:
  /// **'Book conditions'**
  String get conditions;

  /// No description provided for @submited_successfully.
  ///
  /// In en, this message translates to:
  /// **'Submited successfully'**
  String get submited_successfully;

  /// No description provided for @error_submitting.
  ///
  /// In en, this message translates to:
  /// **'There was an error'**
  String get error_submitting;

  /// No description provided for @fill_all_fields.
  ///
  /// In en, this message translates to:
  /// **'Please fill all fields'**
  String get fill_all_fields;

  /// No description provided for @image_upload_error.
  ///
  /// In en, this message translates to:
  /// **'There was an error uploading the image'**
  String get image_upload_error;

  /// No description provided for @invalid_condition.
  ///
  /// In en, this message translates to:
  /// **'Invalid condition'**
  String get invalid_condition;

  /// No description provided for @description_hint.
  ///
  /// In en, this message translates to:
  /// **'Book about algorithms, 2nd edition'**
  String get description_hint;

  /// No description provided for @confirm_new_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirm_new_password;

  /// No description provided for @passwords_do_not_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwords_do_not_match;

  /// No description provided for @same_as_current_password.
  ///
  /// In en, this message translates to:
  /// **'New password cannot be the same as the current password'**
  String get same_as_current_password;

  /// No description provided for @user_mismatch.
  ///
  /// In en, this message translates to:
  /// **'User mismatch. Please log in again.'**
  String get user_mismatch;

  /// No description provided for @invalid_credential.
  ///
  /// In en, this message translates to:
  /// **'Invalid credentials. Please try again.'**
  String get invalid_credential;

  /// No description provided for @verified.
  ///
  /// In en, this message translates to:
  /// **'Email Verified'**
  String get verified;

  /// No description provided for @verify_email.
  ///
  /// In en, this message translates to:
  /// **'Verify Email'**
  String get verify_email;

  /// No description provided for @new_password_too_weak.
  ///
  /// In en, this message translates to:
  /// **'The new password is too weak.'**
  String get new_password_too_weak;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
