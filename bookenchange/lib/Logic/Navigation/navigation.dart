import 'package:bookenchange/UI/Chat.dart';
import 'package:bookenchange/UI/NewContribution/newContribution.dart';
import 'package:bookenchange/UI/Profile/profile.dart';
import 'package:bookenchange/UI/Settings/changePassword.dart';
import 'package:bookenchange/UI/Usersetup/firstTimeuser.dart';
import 'package:bookenchange/UI/ForgotPassword/forgotPassword.dart';
import 'package:bookenchange/UI/Homepage/homePage.dart';
import 'package:bookenchange/UI/Settings/settingsPage.dart';
import 'package:bookenchange/UI/NewContribution.dart';
import 'package:bookenchange/UI/Settings/previousContributions.dart';
import 'package:flutter/material.dart';
import 'package:bookenchange/UI/Profile/profileView.dart';

enum Navigation {
  home(MyHomePage()),
  settings(SettingsPage()),
  nContribution(newContribution()),
  chat(chatPage()),
  edProfile(editProfile()),
  forgotPass(forgotPassword()),
  changePass(ChangePasswordPage()),
  prevContribution(PreviousContributionsPage()),
  profile(ProfilePage());
  
  const Navigation(this.builder);
  final Widget builder;
  Widget get() {
    return builder;
  }
}
