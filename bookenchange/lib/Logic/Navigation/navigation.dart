import 'package:bookenchange/UI/Chat.dart';
import 'package:bookenchange/UI/Homepage/homePage.dart';
import 'package:bookenchange/UI/NewContribution/newContribution.dart';
import 'package:bookenchange/UI/Settings/settingsPage.dart';
import 'package:flutter/material.dart';

enum Navigation {
  home(MyHomePage()),
  settings(SettingsPage()),
  nContribution(newContribution()),
  chat(chatPage());

  const Navigation(this.builder);
  final Widget builder;
  Widget get() {
    return builder;
  }
}
