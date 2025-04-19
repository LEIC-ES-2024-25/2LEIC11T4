import 'package:bookenchange/generated/l10n.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class dropdownSearch extends StatefulWidget {
  final Future<List<String>> Function() get;
  final Future<void> Function(String) add;
  final String name;
  const dropdownSearch({
    super.key,
    required this.get,
    required this.add,
    required this.name,
  });

  @override
  State<dropdownSearch> createState() => _dropdownSearchState();
}

class _dropdownSearchState extends State<dropdownSearch> {
  String? selected;
  List<String> items = [];
  @override
  Widget build(BuildContext context) {
    return Padding(padding:EdgeInsets.all(10), child:DropdownSearch<String>(
      mode: Mode.form,
      items: (String filter, LoadProps? props) async {
        return await widget.get();
      },
      selectedItem: selected,
      onChanged: (value) {
        setState(() {
          selected = value;
        });
      },
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          labelText: widget.name,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onTertiary,
            ),
            borderRadius: BorderRadius.zero,
          ),
        ),
      ),
      popupProps: PopupProps.menu(
        showSearchBox: true,
        emptyBuilder: (context, searchEntry) {
          final TextEditingController controller = TextEditingController(
            text: searchEntry,
          );
          return TextButton(
            onPressed:
                () async => {
                  await widget.add(controller.text.trim()),
                  setState(() {
                    selected = controller.text.trim();
                  })
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
