import 'package:bookenchange/UI/Chat.dart';
import 'package:bookenchange/UI/Edit%20Profile/editProfile.dart';
import 'package:bookenchange/UI/ForgotPassword/forgotPassword.dart';
import 'package:bookenchange/UI/Homepage/homePage.dart';
import 'package:bookenchange/UI/NewContribution/newContribution.dart';
import 'package:bookenchange/UI/Settings/settingsPage.dart';
import 'package:bookenchange/UI/NewContribution.dart';
import 'package:flutter/material.dart';

enum Navigation {
  home(MyHomePage()),
  settings(SettingsPage()),
  nContribution(Newcontribution()),
  chat(chatPage()),
  edProfile(editProfile()),
  forgotPass(forgotPassword());

  const Navigation(this.builder);
  final Widget builder;
  Widget get() {
    return builder;
  }
}
