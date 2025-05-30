import 'package:bookexchange/generated/l10n.dart';
import 'package:flutter/material.dart';

class normalField extends StatelessWidget {
  final controller;
  final String hint;
  final String label;
  const normalField({
    super.key,
    this.controller,
    required this.hint,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onTertiary,
            ),
            borderRadius: BorderRadius.zero,
          ),
        ),
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
