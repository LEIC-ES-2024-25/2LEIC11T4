import 'package:bookenchange/generated/l10n.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class dropdownSearch extends StatefulWidget {
  final Future<List<String>> Function() get;
  final Future<void> Function(String) add;
  final String name;
  String? selected;
  final ValueChanged<String?> onChanged;
  dropdownSearch({
    super.key,
    required this.get,
    required this.add,
    required this.name,
    required this.selected,
    required this.onChanged,
  });

  @override
  State<dropdownSearch> createState() => _dropdownSearchState();
}

class _dropdownSearchState extends State<dropdownSearch> {
  List<String> items = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: DropdownSearch<String>(
        mode: Mode.form,
        items: (String filter, LoadProps? props) async {
          return await widget.get();
        },
        selectedItem: widget.selected,
        onChanged: (value) {
          widget.onChanged(value);
        },
        decoratorProps: DropDownDecoratorProps(
          decoration: InputDecoration(
            labelText: widget.name,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onTertiary,
              ),
            ),
          ),
        ),
        popupProps: PopupProps.menu(
          menuProps: MenuProps(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
          ),
          showSearchBox: true,
          emptyBuilder: (context, searchEntry) {
            final TextEditingController controller = TextEditingController(
              text: searchEntry,
            );
            return TextButton(
              onPressed: () async {
                    final newValue = controller.text.trim();
                    await widget.add(newValue);

                    widget.onChanged(newValue);

                    Navigator.of(context).pop();

                    await Future.delayed(const Duration(milliseconds: 300));

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('"$newValue" has been added.'),
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                    setState(() {
                      widget.selected = newValue;
                    });
                  },
              child: Text(
                S.of(context).add_new,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            );
          },


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
