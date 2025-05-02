import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'areaofStudiesPage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../Domain/theme.dart';

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
  final TextEditingController descController = TextEditingController();
  final TextEditingController isbnController = TextEditingController();

  final List<String> conditions = ['New', 'Used - Good', 'Used - Acceptable'];
  final List<String> areas = ['Computer Science', 'Mathematics', 'Law', 'History'];
  final List<String> universities = ['FEUP', 'FEP', 'FLUP', 'ICBAS'];
  final ImagePicker _picker = ImagePicker();
  List<File> _selectedImages = [];

  Future<void> _pickImages() async {
    if (_selectedImages.length >= 20) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You can only select up to 20 images')),
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
    try{
    final fileName = 'contributions/${DateTime.now().millisecondsSinceEpoch}.jpg';
    final ref = FirebaseStorage.instance.ref().child(fileName);
    await ref.putFile(imageFile);
    return await ref.getDownloadURL();
  }
  catch(e){
    print("Error uploading image: $e");
    rethrow;
  }
  }

  // Save contribution to Firestore
  Future<void> _saveContribution() async {
    if (_formKey.currentState!.validate()){
      List<String> imageUrls = [];
      for (File image in _selectedImages){
        final url = await _uploadImage(image);
        imageUrls.add(url);
      }
      try {
        await FirebaseFirestore.instance.collection('contributions').add({
          'name': nameController.text,
          'description': descController.text,
          'area': selectedArea,
          'isbn': isbnController.text,
          'condition': selectedCondition,
          'university': selectedUniversity,
          'images': imageUrls,
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Contribution saved successfully')),
        );
        // Reset form fields
        _formKey.currentState!.reset();
        setState(() {
          _selectedImages = [];
          selectedArea = null;
          selectedCondition = null;
          selectedUniversity = null;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error saving contribution: $e')),
        );
      }
    }
  }

  Widget _buildAreaSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () async {
          final selected = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AreaOfStudiesPage(),
            ),
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
                    // Save contribution logic
                    List<String> imageUrls = [];
                    for (File image in _selectedImages){
                      final url = await _uploadImage(image);
                      imageUrls.add(url);
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
}