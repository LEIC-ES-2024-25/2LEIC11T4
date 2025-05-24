import 'dart:io';

import 'package:bookenchange/Database/Firebase.dart';
import 'package:bookenchange/Logic/Navigation/navigation.dart';
import 'package:bookenchange/Logic/Navigation/transitions.dart';
import 'package:bookenchange/UI/NewContribution/normalfields.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart' as picker;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:bookenchange/Domain/Models/Book/book.dart';
import 'package:uuid/uuid.dart';

class newContribution extends StatefulWidget {
  @override
  const newContribution({super.key});
  @override
  State<newContribution> createState() => _newContributionState();
}

class _newContributionState extends State<newContribution> {
  final _formKey = GlobalKey<FormState>();

  String? selectedCondition;
  String? selectedDescription;
  String? selectedISBN;
  Book? bookInfo;
  final firebase = Firebase.instance;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController isbnController = TextEditingController();

  final List<String> conditions = ['New', 'Used - Good', 'Used - Acceptable'];
  final ImagePicker _picker = ImagePicker();
  List<File> _selectedImages = [];

  bool _isSearching = false;
  bool _isSubmitting = false;

  Future<void> _pickImages() async {
    if (_selectedImages.length >= 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You can only select up to 5 images')),
      );
      return;
    }

    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path));
      });
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

  Future<void> _saveContribution() async {
    final firebaseService = Firebase();
    final dataBook = await firebaseService.getFireBaseBook(isbnController.text);
    final uuid = Uuid(); // Initialize UUID generator

    if (_formKey.currentState!.validate()) {
      List<String> imageUrls = [];
      for (File image in _selectedImages) {
        final url = await _uploadImage(image);
        imageUrls.add(url);
      }

      try {
        final userId = FirebaseAuth.instance.currentUser?.uid;
        if (userId != null) {
          final userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
          final username = userDoc.exists && userDoc.data() != null
              ? userDoc.data()!['username'] as String?
              : 'Unknown User';

          // Generate a random ID for the contribution
          final contributionId = uuid.v4();

          await FirebaseFirestore.instance.collection('contributions').doc(contributionId).set({
            'id': contributionId, // Add the generated ID
            'iduser': userId,
            'name': dataBook['bookName'],
            'description': descController.text,
            'isbn': isbnController.text,
            'bookId': dataBook['bookId'],
            'condition': selectedCondition,
            'images': imageUrls,
            'username': username,
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Contribution saved successfully')),
          );

          // Reset form fields
          _formKey.currentState!.reset();
          descController.clear();
          isbnController.clear();
          setState(() {
            _selectedImages = [];
            selectedCondition = null;
          });
          Navigator.pop(context);
        } else {
          throw Exception('User not authenticated');
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving contribution: $e')),
        );
      }
    }
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
                    const Text("You can add up to 5 photos"),
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
              TextField(
                controller: isbnController,
                decoration: InputDecoration(
                  labelText: S.of(context).isbn,
                  hintText: "e.g 0596156715",
                  border: const OutlineInputBorder(),
                  suffixIcon: _isSearching
                      ? const Padding(
                    padding: EdgeInsets.all(12),
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                      : IconButton(
                    onPressed: () async {
                      setState(() => _isSearching = true);
                      final result = await firebase.getBookByISBN(
                        isbnController.text.trim(),
                      );
                      setState(() {
                        bookInfo = result;
                        _isSearching = false;
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
                    title: Text(
                      S.of(context).publishers,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    subtitle: Text(
                      bookInfo!.publishers.join(','),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              )
                  : SizedBox.shrink(),
              const SizedBox(height: 10),
              TextField(
                controller: descController,
                decoration: InputDecoration(
                  labelText: S.of(context).description,
                  hintText: S.of(context).description_hint,
                  border: const OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              _buildDropdown("Condition", conditions, selectedCondition, (val) {
                setState(() => selectedCondition = val);
              }),
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: _isSubmitting
                    ? null
                    : () async {
                  // Manual validation for non-Form fields
                  if (_selectedImages.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please add at least one image'), backgroundColor: Colors.red),
                    );
                    return;
                  }

                  if (isbnController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('ISBN cannot be empty'), backgroundColor: Colors.red),
                    );
                    return;
                  }

                  if (descController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Description cannot be empty'), backgroundColor: Colors.red),
                    );
                    return;
                  }

                  if (selectedCondition == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select a condition'), backgroundColor: Colors.red),
                    );
                    return;
                  }

                  if (_formKey.currentState!.validate()) {
                    setState(() => _isSubmitting = true);
                    await _saveContribution();
                    setState(() => _isSubmitting = false);
                  }
                },
                child: _isSubmitting
                    ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
                    : const Text("Submit Contribution"),
              ),
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
}