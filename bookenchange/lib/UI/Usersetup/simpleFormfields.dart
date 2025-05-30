import 'package:bookexchange/generated/l10n.dart';
import 'package:flutter/material.dart';

class normalField extends StatelessWidget {
  final controller;
  final String name;
  final bool enabled;
  const normalField({super.key, required this.controller, required this.name, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        decoration: InputDecoration(
          labelText: name,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),
          // Optional: visually style it even if disabled
          fillColor: enabled ? null : Theme.of(context).disabledColor.withOpacity(0.05),
          filled: !enabled,
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
