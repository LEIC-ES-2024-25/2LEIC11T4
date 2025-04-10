import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

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
                      onPressed: () {
                        // Add photo logic here
                      },
                      icon: const Icon(Icons.photo_camera),
                      label: const Text("Add Photos"),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              _buildTextField(nameController, "Name of the book", "e.g. Fluent Python"),
              _buildTextField(descController, "Description", "Optional description..."),
              _buildDropdown("Area of Study", areas, selectedArea, (val) {
                setState(() => selectedArea = val);
              }),
              _buildTextField(isbnController, "ISBN", "e.g. 9781633436336"),
              _buildDropdown("Condition", conditions, selectedCondition, (val) {
                setState(() => selectedCondition = val);
              }),
              _buildDropdown("University/College", universities, selectedUniversity, (val) {
                setState(() => selectedUniversity = val);
              }),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save contribution logic
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