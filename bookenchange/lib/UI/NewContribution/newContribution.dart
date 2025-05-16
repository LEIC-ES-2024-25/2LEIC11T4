import 'dart:io';

import 'package:bookenchange/Database/Firebase.dart';
import 'package:bookenchange/Logic/Navigation/navigation.dart';
import 'package:bookenchange/Logic/Navigation/transitions.dart';
import 'package:bookenchange/UI/NewContribution/normalfields.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:file_picker/file_picker.dart' as picker;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:bookenchange/Domain/Models/Book/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../Homepage/homePage.dart';

class newContribution extends StatefulWidget {
  @override
  const newContribution({super.key});
  @override
  State<newContribution> createState() => _newContributionState();
}

class _newContributionState extends State<newContribution> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController isbnController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController pubController = TextEditingController();
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController institutionController =
      TextEditingController();

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
  final ImagePicker _picker = ImagePicker();
  List<File> _selectedImages = [];
  Book? bookInfo;

  Widget _buildDropdownWithoutAddOption(String label, List<String> items,
      String? selectedValue, Function(String?) onChanged) {
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
        value == null ? S
            .of(context)
            .not_null : null,
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? selectedValue,
      Function(String?) onChanged) {
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
            child: Text(S
                .of(context)
                .add_new),
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
        validator: (value) =>
        value == null ? S
            .of(context)
            .not_null : null,
      ),
    );
  }

  void _addNewOption(BuildContext context, String title, List<String> list,
      Function(String) onAdd) {
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
                  labelText: S
                      .of(context)
                      .value,
                  border: const OutlineInputBorder(),
                  errorText: controller.text
                      .trim()
                      .isEmpty ? S
                      .of(context)
                      .not_null : null,
                ),
                onChanged: (_) {
                  setState(() {}); // Update the dialog state to show/hide error
                },
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(S
                      .of(context)
                      .cancel),
                ),
                TextButton(
                  onPressed: controller.text
                      .trim()
                      .isEmpty
                      ? null
                      : () {
                    final newOption = controller.text.trim();
                    setState(() {
                      list.add(newOption);
                    });
                    onAdd(newOption);
                    Navigator.pop(context);
                  },
                  child: Text(S
                      .of(context)
                      .add_new),
                ),
              ],
            );
          },
        );
      },
    );
  }


  Future<void> _pickImages() async {
    if (_selectedImages.length >= 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S
            .of(context)
            .add_photo)),
      );
      return;
    }

    final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path));
      });
    }
  }

  Future<String> _uploadImage(File imageFile) async {
    try {
      final fileName = 'contributions/${DateTime
          .now()
          .millisecondsSinceEpoch}.jpg';
      final ref = FirebaseStorage.instance.ref().child(fileName);
      await ref.putFile(imageFile);
      return await ref.getDownloadURL();
    }
    catch (e) {
      print("Error uploading image: $e");
      rethrow;
    }
  }


  // Save contribution to Firestore
  Future<void> _saveContribution() async {
    if (_formKey.currentState!.validate()) {
      // Validação explícita para campos obrigatórios
      if (selectedCondition == null || selectedDegree == null || selectedInstitution == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).fill_all_fields)),
        );
        return;
      }

      if (!conditions.contains(selectedCondition)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).invalid_condition)),
        );
        return;
      }

      if (isbnController.text.trim().isEmpty || descController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).fill_all_fields)),
        );
        return;
      }

      List<String> imageUrls = [];
      try {
        for (File image in _selectedImages) {
          final url = await _uploadImage(image);
          imageUrls.add(url);
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).image_upload_error)),
        );
        return;
      }

      try {
        final userId = FirebaseAuth.instance.currentUser?.uid;
        if (userId == null) {
          throw Exception('User not logged in');
        }

        // Salvando a contribuição no Firestore
        await FirebaseFirestore.instance.collection('contributions').add({
          'uid': userId,
          'isbn': isbnController.text.trim(),
          'description': descController.text.trim(),
          'condition': selectedCondition,
          'degree': selectedDegree,
          'institution': selectedInstitution,
          'images': imageUrls,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Contribution saved successfully')),
        );

        // Resetando os campos do formulário
        _formKey.currentState!.reset();
        setState(() {
          _selectedImages = [];
          selectedDegree = null;
          selectedCondition = null;
          selectedInstitution = null;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving contribution: $e')),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S
                .of(context)
                .new_contribution,
            style: Theme
                .of(context)
                .textTheme
                .titleMedium,
          ),
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .primary,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme
                  .of(context)
                  .colorScheme
                  .onPrimary,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
        ),
        body: Form(
          child: Column(
            children: [
              SizedBox(
                width: 400,
                height: 90,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onPrimary,
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Theme
                            .of(context)
                            .colorScheme
                            .onTertiary,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          S
                              .of(context)
                              .add_photo,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyLarge,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () => _pickImages(),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Theme
                                .of(context)
                                .colorScheme
                                .tertiary,
                          ),
                        ),
                        icon: Icon(
                          Icons.photo_camera,
                          color: Theme
                              .of(context)
                              .indicatorColor,
                        ),
                        label: Text(
                          S
                              .of(context)
                              .photo,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_selectedImages.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _selectedImages.map((image) {
                      return Image.file(
                        File(image.path),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      );
                    }).toList(),
                  ),
                ),

              TextField(
                controller: isbnController,
                decoration: InputDecoration(
                  labelText: S
                      .of(context)
                      .isbn,
                  hintText: "e.g 0596156715",
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 16),
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
                      color: Theme
                          .of(context)
                          .indicatorColor,
                    ),
                  ),
                ),
              ),
              bookInfo != null
                  ? ExpansionTile(
                title: Text(
                  S
                      .of(context)
                      .book_tittle,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge,
                ),
                subtitle: Text(
                  bookInfo!.name,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge,
                ),
                children: [
                  ListTile(
                    title: Text(
                      S
                          .of(context)
                          .authors,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge,
                    ),
                    subtitle: Text(
                      bookInfo!.authors.join(','),
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      S
                          .of(context)
                          .publishers,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge,
                    ),
                    subtitle: Text(
                      bookInfo!.publishers.join(','),
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall,
                    ),
                  ),

                ],
              )
                  : SizedBox.shrink(),
              //dropdown with condition
              //searchdropdown areaof study

              TextField(
                controller: descController,
                decoration: InputDecoration(
                  labelText: S.of(context).description,
                  hintText: S.of(context).description_hint,
                  border: const OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              _buildDropdown(
                S
                    .of(context)
                    .degree,
                degrees,
                selectedDegree,
                    (value) {
                  if (value == S
                      .of(context)
                      .add_new) {
                    _addNewOption(
                      context,
                      S
                          .of(context)
                          .degree,
                      degrees,
                          (newArea) =>
                          setState(() => selectedDegree = newArea),
                    );
                  } else {
                    setState(() => selectedDegree = value ?? '');
                  }
                },
              ),

              // Dropdown for College
              _buildDropdown(
                S
                    .of(context)
                    .university_college,
                institutions,
                selectedInstitution,
                    (value) {
                  if (value == S
                      .of(context)
                      .add_new) {
                    _addNewOption(
                      context,
                      S
                          .of(context)
                          .university_college,
                      institutions,
                          (newCollege) =>
                          setState(() =>
                          selectedInstitution = newCollege),
                    );
                  } else {
                    setState(() => selectedInstitution = value ?? '');
                  }
                },
              ),
              _buildDropdownWithoutAddOption(S
                  .of(context)
                  .conditions,
                conditions,
                selectedCondition, (value) {
                  setState(() => selectedCondition = value);
                },),

              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _saveContribution();
                  };

                  child: Text(S.of(context).
                  submit
    );
                }
    )
              ]
          ),
          ),
        ),
      );
    }
  }

