import 'package:bookenchange/generated/l10n.dart';
import 'package:flutter/material.dart';

class loginTextFields extends StatelessWidget {
  final controller;
  final String label;
  final bool obscureText;
  final String? hint;
  const loginTextFields({
    super.key,
    required this.controller,
    required this.label,
    required this.obscureText,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,

        decoration: InputDecoration(
          labelText: label,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          fillColor: Theme.of(context).colorScheme.onPrimary,
          filled: true,
          hintText: hint ?? "",
        ),
        obscureText: obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).not_null;
          }
          return null;
        },
      ),
    );
  }
}
