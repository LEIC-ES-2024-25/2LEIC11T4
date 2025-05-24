import 'package:flutter/material.dart';

const Color accent = Color(0xffd6eadf);
const Color secondary = Color(0xffb8e0d4);
const Color highlights = Color(0xff95b8d1);
const Color primary = Color(0xff809bce);
const Color textcolour = Color(0xff000000);
const Color secondaryTextColour = Color.fromARGB(255, 48, 48, 48);
const Color ternary = Color(0xffffffff);

const textTheme = TextTheme(
  displayLarge: TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w400,
    color: textcolour,
  ),
  displayMedium: TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w400,
    color: textcolour,
  ),
  displaySmall: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    color: secondaryTextColour,
  ),
  bodyLarge: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: secondaryTextColour,
  ),
  bodyMedium: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: secondaryTextColour,
  ),
  bodySmall: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textcolour,
  ),
  labelLarge: TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w400,
    color: secondaryTextColour,
  ),
  labelMedium: TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w400,
    color: secondaryTextColour,
  ),
  labelSmall: TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w400,
    color: secondaryTextColour,
  ),
);

ThemeData ligthTheme = ThemeData(
  useMaterial3: true,
  textTheme: textTheme,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primary,
    primary: primary,
    onPrimary: ternary,
    secondary: accent,
    onSecondary: textcolour,
    surface: ternary,
    onSurface: textcolour,
    error: Colors.red,
    onError: ternary,
    tertiary: highlights,
    onTertiary: textcolour,
  ),
  primaryColor: primary,
  cardTheme: CardThemeData(margin: EdgeInsets.all(4), color: ternary),
  dividerColor: secondaryTextColour,
  hintColor: secondaryTextColour,
  indicatorColor: secondary,
  secondaryHeaderColor: accent,
  focusColor: highlights,
  shadowColor: secondaryTextColour,
  iconTheme: const IconThemeData(color: textcolour),
);
