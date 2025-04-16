import 'package:bookenchange/generated/l10n.dart';
import 'package:flutter/material.dart';

class normalField extends StatelessWidget {

  final controller;
  final String name;
  const normalField({
    super.key,
    required this.controller,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(children: [Text(name,style:
      Theme.of(
        context,
      ).textTheme.bodySmall),
        TextFormField(
        controller: controller,
        decoration: InputDecoration(
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
      ),]
      ),
    );
  }
}
