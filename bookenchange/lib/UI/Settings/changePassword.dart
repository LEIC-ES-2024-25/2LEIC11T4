import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController(); // New controller
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isUpdating = false;
  bool _obscurePreviousPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmNewPassword = true;

  // Define your strings directly here for testing
  final String _passwordChangedSuccessfully = "Password changed successfully";
  final String _changePasswordFailed = "Change password failed";
  final String _wrongCurrentPassword = "Wrong current password";
  final String _pleaseEnterPassword = "Please enter your password";
  final String _passwordTooShort =
      "Password must be at least 6 characters long";
  final String _currentPasswordLabel = "Current Password";
  final String _valueHint = "Value";
  final String _newPasswordLabel = "New Password";
  final String _submitButtonText = "Submit";
  final String _changePasswordTitle = "Change Password";
  final String _confirmNewPasswordLabel = "Confirm New Password";
  final String _passwordsDoNotMatch = "Passwords do not match";
  final String _sameAsCurrentPassword =
      "New password cannot be the same as the current password";

  Future<void> _changePassword(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final currentPassword = _currentPasswordController.text.trim();
      final newPassword = _newPasswordController.text.trim();

      if (currentPassword == newPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(_sameAsCurrentPassword),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }

      if (newPassword != _confirmNewPasswordController.text.trim()) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(_passwordsDoNotMatch),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }

      setState(() {
        _isUpdating = true;
      });
      try {
        final user = FirebaseAuth.instance.currentUser;
        final credential = EmailAuthProvider.credential(
          email: user!.email!,
          password: _currentPasswordController.text.trim(),
        );

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
          errorMessage = _wrongCurrentPassword;
        } else if (e.code == 'user-mismatch') {
          errorMessage = 'User mismatch. Please log in again.';
        } else if (e.code == 'invalid-credential') {
          errorMessage = 'Invalid credentials. Please try again.';
        } else if (e.code == 'weak-password') {
          errorMessage = 'The new password is too weak.';
        } else {
          // Log the error code for debugging
          debugPrint('FirebaseAuthException: ${e.code}');
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
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
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
                    controller: _currentPasswordController,
                    obscureText: _obscurePreviousPassword,
                    decoration: InputDecoration(
                      labelText: _currentPasswordLabel,
                      border: const OutlineInputBorder(),
                      hintText: _valueHint,
                      suffixIcon: IconButton(
                        // Eye icon for previous password
                        icon: Icon(
                          _obscurePreviousPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePreviousPassword =
                                !_obscurePreviousPassword;
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
                      suffixIcon: IconButton(
                        // Eye icon for new password
                        icon: Icon(
                          _obscureNewPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
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
                    obscureText:
                        _obscureConfirmNewPassword, // Use the new obscure state
                    decoration: InputDecoration(
                      labelText: _confirmNewPasswordLabel,
                      border: const OutlineInputBorder(),
                      hintText: _valueHint,
                      suffixIcon: IconButton(
                        // Eye icon for confirm password
                        icon: Icon(
                          _obscureConfirmNewPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmNewPassword =
                                !_obscureConfirmNewPassword;
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
                      backgroundColor: const Color(
                        0xFFBDEDD3,
                      ), // match the green tint
                      foregroundColor: Colors.black,
                    ),
                    onPressed:
                        _isUpdating ? null : () => _changePassword(context),
                    child:
                        _isUpdating
                            ? const CircularProgressIndicator()
                            : Text(_submitButtonText),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
