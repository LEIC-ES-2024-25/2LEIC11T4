import 'package:flutter/material.dart';
import 'package:bookenchange/generated/l10n.dart';

class normalDropdown extends StatefulWidget {
  final List<int> years;
  final String label;
  int? selected;
  final ValueChanged<int?> onChanged;
  normalDropdown({
    super.key,
    required this.years,
    required this.label,
    required this.selected,
    required this.onChanged,
  });

  @override
  State<normalDropdown> createState() => _normalDropdownState();
}

class _normalDropdownState extends State<normalDropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: DropdownButtonFormField<int>(
        decoration: InputDecoration(
          labelText: widget.label,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),
        ),
        isExpanded: true,
        items:
            widget.years.map((int year) {
              return DropdownMenuItem<int>(
                value: year,
                child: Text(year.toString()),
              );
            }).toList(),
        onChanged: (value) => {widget.onChanged(value)},
        dropdownColor: Theme.of(context).colorScheme.tertiary,
        validator: (value) {
          if (value == null) {
            return S.of(context).not_null;
          }
          return null;
        },
      ),
    );
  }
}
