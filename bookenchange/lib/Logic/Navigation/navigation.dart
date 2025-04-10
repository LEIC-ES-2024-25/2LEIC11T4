import 'package:bookenchange/UI/Chat.dart';
import 'package:bookenchange/UI/Homepage/homePage.dart';
import 'package:bookenchange/UI/NewContribution.dart';
import 'package:bookenchange/UI/settingsPage.dart';
import 'package:flutter/cupertino.dart';

enum Navigation {
  home(MyHomePage()),
  settings(SettingsPage()),
  newContribution(Newcontribution()),
  chat(chatPage());

  const Navigation(this.builder);
  final Widget builder;
  Widget get() {
    return builder;
  }
}
