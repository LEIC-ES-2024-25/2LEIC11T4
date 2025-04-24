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

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _previousPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController = TextEditingController(); // New controller
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isUpdating = false;
  bool _obscurePreviousPassword = true; 
  bool _obscureNewPassword = true;     
  bool _obscureConfirmNewPassword = true;
  
  // Define your strings directly here for testing
  final String _passwordChangedSuccessfully = "Password changed successfully";
  final String _changePasswordFailed = "Change password failed";
  final String _wrongPreviousPassword = "Wrong previous password";
  final String _pleaseEnterPassword = "Please enter your password";
  final String _passwordTooShort = "Password must be at least 6 characters long";
  final String _previousPasswordLabel = "Previous Password";
  final String _valueHint = "Value";
  final String _newPasswordLabel = "New Password";
  final String _submitButtonText = "Submit";
  final String _changePasswordTitle = "Change Password";
  final String _confirmNewPasswordLabel = "Confirm New Password";
  final String _passwordsDoNotMatch = "Passwords do not match";

  Future<void> _changePassword(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (_newPasswordController.text.trim() != _confirmNewPasswordController.text.trim()) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(_passwordsDoNotMatch),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return; // Stop the process if passwords don't match
      }

      setState(() {
        _isUpdating = true;
      });
      try {
        final user = FirebaseAuth.instance.currentUser;
        final credential = EmailAuthProvider.credential(
            email: user!.email!, password: _previousPasswordController.text.trim());

        await user.reauthenticateWithCredential(credential);
        await user.updatePassword(_newPasswordController.text.trim());

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(_passwordChangedSuccessfully),
              behavior: SnackBarBehavior.floating,
            ),
          );
          Navigator.pop(context); // Go back to settings after success
        }
      } on FirebaseAuthException catch (e) {
        String errorMessage = _changePasswordFailed;
        if (e.code == 'wrong-password') {
          errorMessage = _wrongPreviousPassword;
        } else if (e.code == 'weak-password') {
          errorMessage = "Weak password"; // Kept as direct string as in original
        }
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(errorMessage),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      } finally {
        setState(() {
          _isUpdating = false;
        });
      }
    }
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return _pleaseEnterPassword;
    }
    if (value.length < 6) {
      return _passwordTooShort;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _changePasswordTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            Navigator.pop(context); // Goes back to SettingsPage
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: _previousPasswordController,
                  obscureText: _obscurePreviousPassword,
                  decoration: InputDecoration(
                    labelText: _previousPasswordLabel,
                    border: const OutlineInputBorder(),
                    hintText: _valueHint,
                    suffixIcon: IconButton( // Eye icon for previous password
                      icon: Icon(
                        _obscurePreviousPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePreviousPassword = !_obscurePreviousPassword;
                        });
                      },
                    ),
                  ),
                  validator: _validatePassword,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _newPasswordController,
                  obscureText: _obscureNewPassword,
                  decoration: InputDecoration(
                    labelText: _newPasswordLabel,
                    border: const OutlineInputBorder(),
                    hintText: _valueHint,
                    suffixIcon: IconButton( // Eye icon for new password
                      icon: Icon(
                        _obscureNewPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureNewPassword = !_obscureNewPassword;
                        });
                      },
                    ),
                  ),
                  validator: _validatePassword,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _confirmNewPasswordController,
                  obscureText: _obscureConfirmNewPassword, // Use the new obscure state
                  decoration: InputDecoration(
                    labelText: _confirmNewPasswordLabel,
                    border: const OutlineInputBorder(),
                    hintText: _valueHint,
                    suffixIcon: IconButton( // Eye icon for confirm password
                      icon: Icon(
                        _obscureConfirmNewPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmNewPassword = !_obscureConfirmNewPassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return _pleaseEnterPassword;
                    }
                    if (value != _newPasswordController.text) {
                      return _passwordsDoNotMatch; // Add a specific error message
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFBDEDD3), // match the green tint
                    foregroundColor: Colors.black,
                  ),
                  onPressed: _isUpdating ? null : () => _changePassword(context),
                  child: _isUpdating
                      ? const CircularProgressIndicator()
                      : Text(_submitButtonText),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}