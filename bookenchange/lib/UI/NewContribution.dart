import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'NewContribution/areaofStudiesPage.dart';
import '../firebase_options.dart';

class Newcontribution extends StatefulWidget {
  const Newcontribution({super.key});

  @override
  State<Newcontribution> createState() => _NewContributionState();
}

class _NewContributionState extends State<Newcontribution> {
  final _formKey = GlobalKey<FormState>();

  String? selectedCondition;
  String? selectedArea;
  String? selectedUniversity;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController pubController = TextEditingController();
  final TextEditingController degController = TextEditingController();
  final TextEditingController isbnController = TextEditingController();

  final List<String> conditions = ['New', 'Used - Good', 'Used - Acceptable'];
  final List<String> areas = [
    'Computer Science',
    'Mathematics',
    'Law',
    'History',
  ];
  final List<String> universities = ['FEUP', 'FEP', 'FLUP', 'ICBAS'];

  Widget _buildAreaSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () async {
          final selected = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AreaOfStudiesPage()),
          );
          if (selected != null && selected is String) {
            setState(() {
              selectedArea = selected;
            });
          }
        },
        child: InputDecorator(
          decoration: const InputDecoration(
            labelText: "Area of Study",
            border: OutlineInputBorder(),
          ),
          child: Text(
            selectedArea ?? 'Tap to select Area',
            style: TextStyle(
              color: selectedArea == null ? Colors.grey : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Contribution',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Column(
                  children: [
                    const Text("You can add up to 20 photos"),
                    const SizedBox(height: 8),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Pressing logic - adding photos
                      },
                      icon: const Icon(Icons.photo_camera),
                      label: const Text("Add Photos"),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              _buildTextField(
                nameController,
                "Title",
                "e.g. Fluent Python, Introduction to Algorithms, ...",
              ),
              _buildTextField(
                authorController,
                "Author",
                "e.g. Thomas H. Cormen, Clifford Stein ...",
              ),
              _buildTextField(
                pubController,
                "Publisher",
                "The MIT Press, O'Reilly Media ...",
              ),
              _buildTextField(
                descController,
                "Description",
                "Optional description...",
              ),
              _buildAreaSelector(),
              _buildTextField(isbnController, "ISBN", "e.g. 9781633436336"),
              _buildDropdown("Condition", conditions, selectedCondition, (val) {
                setState(() => selectedCondition = val);
              }),
              _buildDropdown(
                "institution/College",
                universities,
                selectedUniversity,
                (val) {
                  setState(() => selectedUniversity = val);
                },
              ),
              _buildTextField(degController, "Degree", "L.EIC, L.EQ, L.EM"),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      final existingBook =
                          await FirebaseFirestore.instance
                              .collection('book')
                              .where('isbn', isEqualTo: isbnController.text)
                              .limit(1)
                              .get();

                      DocumentReference bookRef;
                      if (existingBook.docs.isEmpty) {
                        final newBook = await FirebaseFirestore.instance
                            .collection('book')
                            .add({
                              'name': nameController.text,
                              'author': authorController.text,
                              'publisher': pubController.text,
                              'description': descController.text,
                              'isbn': isbnController.text,
                            });
                        bookRef = newBook;
                      } else {
                        bookRef = existingBook.docs.first.reference;
                      }
                      // has to be revised
                      final currentUser = FirebaseAuth.instance.currentUser;
                      if (currentUser == null) {
                        throw Exception("User not authenticated");
                      }
                      /*final ImagePicker _picker = ImagePicker();
                      List<XFile> _selectedImages = [];

                      final storage = FirebaseStorage.instance;
                      List<String>  imageUrls = [];

                      for (var image in _selectedImages) {
                        final ref = storage.ref().child('images/${image.name}');
                        await ref.putFile(File(image.path));
                        final url = await ref.getDownloadURL();
                        imageUrls.add(url);
                      }

                      Future<void> _pickImages() async {
                        final List<XFile>? images = await _picker.pickMultiImage();
                        if (images != null && images.length + _selectedImages.length <= 20){
                          setState(() {
                            _selectedImages.addAll(images);
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('You can only upload up to 20 images.')),
                          );
                        }
                      }*/

                      // institution has to be a reference because there is a class for it in the db
                      await FirebaseFirestore.instance
                          .collection('contribution')
                          .add({
                            'idBook': bookRef,
                            'condition': selectedCondition,
                            'institution': selectedUniversity,
                            'iduser': currentUser.uid,
                            'timestamp': FieldValue.serverTimestamp(),
                          });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Contribution submitted successfully!'),
                        ),
                      );
                      // Save contribution logic
                      Navigator.pop(context);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to submit: $e')),
                      );
                    }
                  }
                },
                child: const Text("Submit Contribution"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    String hint,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field cannot be empty';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    List<String> items,
    String? selectedValue,
    Function(String?) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        items:
            items.map((item) {
              return DropdownMenuItem<String>(value: item, child: Text(item));
            }).toList(),
        onChanged: onChanged,
        validator: (value) => value == null ? 'Please select $label' : null,
      ),
    );
  }
}
