/*import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'areaofStudiesPage.dart';

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
  final TextEditingController isbnController = TextEditingController();

  final List<String> conditions = ['New', 'Used - Good', 'Used - Acceptable'];
  final List<String> areas = ['Computer Science', 'Mathematics', 'Law', 'History'];
  final List<String> universities = ['FEUP', 'FEP', 'FLUP', 'ICBAS'];
  final ImagePicker _picker = ImagePicker();
  List<File> _selectedImages = [];

  Future<void> _pickImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null && _selectedImages.length + images.length <= 20) {
      setState(() {
        _selectedImages.addAll(images.map((xfile) => File(xfile.path)));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You can only select up to 20 images')),
      );
    }
  }

  Future<String> _uploadImage(File imageFile) async {
    try {
      final fileName = 'contributions/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final ref = FirebaseStorage.instance.ref().child(fileName);
      await ref.putFile(imageFile);
      return await ref.getDownloadURL();
    } catch (e) {
      print("Error uploading image: $e");
      rethrow;
    }
  }

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
            style: TextStyle(color: selectedArea == null ? Colors.grey : Colors.black),
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
          style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
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
                      onPressed: _pickImages,
                      icon: const Icon(Icons.photo_camera),
                      label: const Text("Add Photos"),
                    ),
                    if (_selectedImages.isNotEmpty)
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _selectedImages.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Image.file(_selectedImages[index], fit: BoxFit.cover),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                  icon: Icon(Icons.cancel, color: theme.colorScheme.primary),
                                  onPressed: () {
                                    setState(() {
                                      _selectedImages.removeAt(index);
                                    });
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              _buildTextField(nameController, "Name of the book", "e.g. Fluent Python, Introduction to Algorithms, ..."),
              _buildTextField(authorController, "Author", "e.g. Luciano Ramalho"),
              _buildTextField(pubController, "Publisher", "e.g. O'Reilly"),
              _buildTextField(descController, "Description", "Optional description..."),
              _buildAreaSelector(),
              _buildTextField(isbnController, "ISBN", "e.g. 9781633436336"),
              _buildDropdown("Condition", conditions, selectedCondition, (val) {
                setState(() => selectedCondition = val);
              }),
              _buildDropdown("University/College", universities, selectedUniversity, (val) {
                setState(() => selectedUniversity = val);
              }),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      final currentUser = FirebaseAuth.instance.currentUser;
                      if (currentUser == null) {
                        throw Exception("User not authenticated");
                      }

                      // Upload images and collect URLs
                      List<String> imageUrls = [];
                      for (var image in _selectedImages) {
                        final url = await _uploadImage(image);
                        imageUrls.add(url);
                      }

                      // Check or create book
                      final existingBook = await FirebaseFirestore.instance
                          .collection('book')
                          .where('isbn', isEqualTo: isbnController.text)
                          .limit(1)
                          .get();

                      DocumentReference bookRef;
                      if (existingBook.docs.isEmpty) {
                        final newBook = await FirebaseFirestore.instance.collection('book').add({
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

                      // Add contribution
                      await FirebaseFirestore.instance.collection('contribution').add({
                        'idBook': bookRef,
                        'condition': selectedCondition,
                        'institution': selectedUniversity,
                        'iduser': currentUser.uid,
                        'timestamp': FieldValue.serverTimestamp(),
                        'area': selectedArea,
                        'images': imageUrls,
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Contribution submitted successfully!')),
                      );

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

  Widget _buildTextField(TextEditingController controller, String label, String hint) {
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

  Widget _buildDropdown(String label, List<String> items, String? selectedValue, Function(String?) onChanged) {
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
        validator: (value) => value == null ? 'Please select $label' : null,
      ),
    );
  }
}*/
