import 'package:bookenchange/UI/Chat.dart';
import 'package:bookenchange/UI/NewContribution.dart';
import 'package:bookenchange/UI/areaofStudiesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Domain/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'UI/Homepage/homePage.dart';
import 'firebase_options.dart';
import 'UI/settingsPage.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      home: const MyHomePage(),
      initialRoute: '/',
      routes: {
        '/settings': (context) => const SettingsPage(),
        '/chat': (context) => const chatPage(),
        '/new_contribution': (context) => const Newcontribution(),
      },
    );
  }
}


