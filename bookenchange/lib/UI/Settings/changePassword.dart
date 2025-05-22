import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bookenchange/generated/l10n.dart';

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


  Future<void> _changePassword(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final currentPassword = _currentPasswordController.text.trim();
      final newPassword = _newPasswordController.text.trim();

      if (currentPassword == newPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(S.of(context).same_as_current_password),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }

      if (newPassword != _confirmNewPasswordController.text.trim()) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(S.of(context).passwords_do_not_match),
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
              content: Text(S.of(context).password_changed_successfully),
              behavior: SnackBarBehavior.floating,
            ),
          );
          Navigator.pop(context); // Go back to settings after success
        }
      } on FirebaseAuthException catch (e) {
        String errorMessage = S.of(context).change_password_failed;
        if (e.code == 'wrong-password') {
          errorMessage = S.of(context).wrong_previous_password;
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
      return S.of(context).please_enter_password;
    }
    if (value.length < 6) {
      return S.of(context).password_too_short;
    }
    return null;
  }

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
                      labelText: S.of(context).previous_password,
                      border: const OutlineInputBorder(),
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
                      labelText: S.of(context).new_password,
                      border: const OutlineInputBorder(),

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
                      labelText: S.of(context).confirm_new_password,
                      border: const OutlineInputBorder(),
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
                        return S.of(context).confirm_new_password;
                      }
                      if (value != _newPasswordController.text) {
                        return S.of(context).passwords_do_not_match; // Add a specific error message
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
                            : Text(S.of(context).submit),
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