import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildDropdown({
  required String? selectedValue,
  required String label,
  required List<String> items,
  required void Function(String?) onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: DropdownButtonFormField<String>(
      value: selectedValue,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
      validator: (value) =>
      value == null ? 'Please select $label' : null,
    ),
  );
}
