import 'package:bookenchange/UI/Login/logIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Domain/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'UI/Homepage/homePage.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'package:bookenchange/Logic/Authentication.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final prefs = await SharedPreferences.getInstance();
  final bool rememberMe = prefs.getBool('remember_me') ?? false;
  if (!rememberMe) {
    await FirebaseAuth.instance.signOut();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Auth auth = Auth();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Donation',
      theme: ligthTheme,
      localizationsDelegates: const [
        S.delegate, // This should be the localization delegate you generated
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: auth.currentUser != null ? MyHomePage() : Login(),
    );
  }
}
