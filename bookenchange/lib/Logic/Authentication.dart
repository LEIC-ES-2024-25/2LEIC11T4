import 'package:bookenchange/Logic/Navigation/navigation.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Navigation/transitions.dart';

class Auth {
  static final Auth _instance = Auth();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  String? get userid => currentUser?.uid;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  static Auth get instance => _instance;
  Future<void> signin(
    BuildContext context,
    username,
    password,
    value,
    GlobalKey<FormState> formKey,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    if (formKey.currentState!.validate()) {
      try {
        await _firebaseAuth.signInWithEmailAndPassword(
          email: username.text.trim(),
          password: password.text.trim(),
        );
        prefs.setBool('remember_me', value);
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            CustomPageRoute(destination: Navigation.home),
          );
        }
      } on FirebaseAuthException {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              content: Text(
                S.of(context).sign_in_unsuccesful,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(
                bottom: MediaQuery.sizeOf(context).height * 0.91,
                left: 10,
                right: 10,
              ),
            ),
          );
        }
      }
    }
  }

  Future<void> signup(
    BuildContext context,
    username,
    password,
    value,
    GlobalKey<FormState> formKey,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    if (formKey.currentState!.validate()) {
      try {
        await _firebaseAuth.createUserWithEmailAndPassword(
          email: username.text.trim(),
          password: password.text.trim(),
        );
        prefs.setBool('remember_me', value);
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            CustomPageRoute(destination: Navigation.edProfile),
          );
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                content: Text(
                  S.of(context).already_in_use,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.only(
                  bottom: MediaQuery.sizeOf(context).height * 0.91,
                  left: 10,
                  right: 10,
                ),
              ),
            );
          }
        }
      }
    }
  }

  Future<bool> recover(BuildContext context, TextEditingController controller) async {
    final email = controller.text.trim();

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
      return false;
    }
  }

}
