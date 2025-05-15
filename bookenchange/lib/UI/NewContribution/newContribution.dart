import 'dart:io';

import 'package:bookenchange/Database/Firebase.dart';
import 'package:bookenchange/Logic/Navigation/navigation.dart';
import 'package:bookenchange/Logic/Navigation/transitions.dart';
import 'package:bookenchange/UI/NewContribution/normalfields.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:file_picker/file_picker.dart' as picker;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:bookenchange/Domain/Models/Book/book.dart';

class newContribution extends StatefulWidget {
  @override
  const newContribution({super.key});
  @override
  State<newContribution> createState() => _newContributionState();
}

class _newContributionState extends State<newContribution> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController isbnController = TextEditingController();

  String? selectedDegree;
  String? selectedCondition;
  String? selectedInstitution;
  List<String> degrees = [
    'LEIC',
    'LEEC',
    'LEM',
    'LEGI',
    'LEME',
    'LEA',
  ];
  List<String> institutions = [
    'FEUP',
    'FCUP',
    'FMUP',
    'FLUP',
    'FEP',
    'FBAUP',
    'FMDUP',
    'FAUP',
    'FCNAUP',
    'FDUP'
  ];

  final List<String> conditions = ['New', 'Used', 'Damaged'];
  final firebase = Firebase.instance;
  List<File> pickedFiles = [];
  Book? bookInfo;

  Widget _buildDropdownWithoutAddOption(String label, List<String> items, String? selectedValue, Function(String?) onChanged) {
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
        validator: (value) => value == null ? S.of(context).not_null : null,
      ),
    );
  }
  Widget _buildDropdown(String label, List<String> items, String? selectedValue, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        items: [
          ...items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          DropdownMenuItem<String>(
            value: 'add_new',
            child: Text(S.of(context).add_new),
          ),
        ],
        onChanged: (value) {
          if (value == 'add_new') {
            _addNewOption(
              context,
              label,
              items,
                  (newOption) => onChanged(newOption),
            );
          } else {
            onChanged(value);
          }
        },
        validator: (value) => value == null ? S.of(context).not_null : null,
      ),
    );
  }
  void _addNewOption(BuildContext context, String title, List<String> list, Function(String) onAdd) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(title),
              content: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: S.of(context).value,
                  border: const OutlineInputBorder(),
                  errorText: controller.text.trim().isEmpty ? S.of(context).not_null : null,
                ),
                onChanged: (_) {
                  setState(() {}); // Update the dialog state to show/hide error
                },
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(S.of(context).cancel),
                ),
                TextButton(
                  onPressed: controller.text.trim().isEmpty
                      ? null
                      : () {
                    final newOption = controller.text.trim();
                    setState(() {
                      list.add(newOption);
                    });
                    onAdd(newOption);
                    Navigator.pop(context);
                  },
                  child: Text(S.of(context).add_new),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> uploadImages() async {
    final status = await Permission.photos.request();
    if (status.isPermanentlyDenied || status.isDenied) {
      await openAppSettings(); // Open app settings using permission_handler
    } else {
      final result = await picker.FilePicker.platform.pickFiles(
        type: picker.FileType.image,
        allowMultiple: true,
      );
      final newPaths =
          result!.files
              .where(
                (file) => file.path != null && !pickedFiles.contains(file.path),
              )
              .map((file) => file.path!)
              .toList();
      final availableSlots = 5 - pickedFiles.length;
      final limitedFiles = newPaths.take(availableSlots).toList();
      setState(() {
        pickedFiles.addAll(limitedFiles.map((path) => File(path)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).new_contribution,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                width: 400,
                height: 90,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          S.of(context).add_photo,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () => uploadImages(),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        icon: Icon(
                          Icons.photo_camera,
                          color: Theme.of(context).indicatorColor,
                        ),
                        label: Text(
                          S.of(context).photo,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              TextField(
                controller: isbnController,
                decoration: InputDecoration(
                  labelText: S.of(context).isbn,
                  hintText: "e.g 0596156715",
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      final result = await firebase.getBookByISBN(
                        isbnController.text.trim(),
                      );
                      setState(() {
                        bookInfo = result;
                      });
                    },
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                ),
              ),
              bookInfo != null
                  ? ExpansionTile(
                    title: Text(
                          S.of(context).book_tittle,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                    subtitle: Text(
                      bookInfo!.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    children: [
                      ListTile(
                        title: Text(
                          S.of(context).authors,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        subtitle: Text(
                          bookInfo!.authors.join(','),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      ListTile(
                        title:Text(
                          S.of(context).publishers,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ) ,
                        subtitle: Text(
                          bookInfo!.publishers.join(','),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),

                    ],
                  )
                  : SizedBox.shrink(),
              //dropdown with condition
              //searchdropdown areaof study

              _buildDropdown(
                S.of(context).degree,
                degrees,
                selectedDegree,
                    (value) {
                  if (value == S.of(context).add_new) {
                    _addNewOption(
                      context,
                      S.of(context).degree,
                      degrees,
                          (newArea) => setState(() => selectedDegree = newArea),
                    );
                  } else {
                    setState(() => selectedDegree = value);
                  }
                },
              ),

              // Dropdown for College
              _buildDropdown(
                S.of(context).university_college,
                institutions,
                selectedInstitution,
                    (value) {
                  if (value == S.of(context).add_new) {
                    _addNewOption(
                      context,
                      S.of(context).university_college,
                      institutions,
                          (newCollege) => setState(() => selectedInstitution = newCollege),
                    );
                  } else {
                    setState(() => selectedInstitution = value);
                  }
                },
              ),
              _buildDropdownWithoutAddOption(S.of(context).conditions, conditions.where((item) => item != 'add_new').toList(), selectedCondition, (value) {
                setState(() => selectedCondition = value);
              },),
      ],
          ),
    ),
    ),
    );
  }


  @override
  void dispose() {
    nameController.dispose();
    descController.dispose();
    isbnController.dispose();
    super.dispose();
  }
}
