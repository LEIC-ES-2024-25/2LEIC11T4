import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookenchange/Logic/Navigation/navigation.dart';
import 'package:bookenchange/Logic/Navigation/transitions.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:bookenchange/UI/Homepage/homePage.dart';
import 'package:bookenchange/Logic/Authentication.dart';
import 'package:bookenchange/UI/Login/logIn.dart';
import 'package:bookenchange/UI/Settings/settingsPage.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _previousPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            S.of(context).change_password,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              Navigator.pop(context); // Goes back to HomePage
            },
          ),
          centerTitle: true,
        ),
      backgroundColor: const Color(0xFF9EC1C4), // light blue background
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: const Color(0xFFD9EFE5), // light mint green background
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              TextField(
                controller: _previousPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Previous Password",
                  border: OutlineInputBorder(),
                  hintText: "Value",
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "New Password",
                  border: OutlineInputBorder(),
                  hintText: "Value",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBDEDD3), // match the green tint
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  // You’ll handle the DB logic later here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Change password logic not implemented yet.')),
                  );
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
