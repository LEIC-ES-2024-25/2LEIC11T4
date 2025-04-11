import 'package:flutter/material.dart';

class simple extends StatelessWidget {
  final String field;
  final controller;
  final String hintText;
  const simple({
    super.key,
    required this.field,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            field,
            style:
                Theme.of(
                  context,
                ).textTheme.bodyMedium, // Using theme text styles
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
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
              hintText: hintText,
            ),
            autovalidateMode: AutovalidateMode.always,
          ),
        ],
      ),
    );
  }
}
