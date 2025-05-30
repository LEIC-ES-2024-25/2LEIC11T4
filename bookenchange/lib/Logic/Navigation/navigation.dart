import 'package:bookexchange/UI/Chat.dart';
import 'package:bookexchange/UI/NewContribution/newContribution.dart';
import 'package:bookexchange/UI/Profile/profile.dart';
import 'package:bookexchange/UI/Settings/changePassword.dart';
import 'package:bookexchange/UI/Usersetup/firstTimeuser.dart';
import 'package:bookexchange/UI/ForgotPassword/forgotPassword.dart';
import 'package:bookexchange/UI/Homepage/homePage.dart';
import 'package:bookexchange/UI/Settings/settingsPage.dart';
import 'package:bookexchange/UI/NewContribution.dart';
import 'package:bookexchange/UI/Settings/previousContributions.dart';
import 'package:flutter/material.dart';
import 'package:bookexchange/UI/Profile/profileView.dart';

import '../../UI/ChatHub.dart';

enum Navigation {
  home(MyHomePage()),
  settings(SettingsPage()),
  nContribution(newContribution()),
  chatHub(ChatHub()),
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
