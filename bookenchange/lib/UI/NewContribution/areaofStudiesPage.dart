import 'package:flutter/material.dart';
import '../NewContribution.dart'; // Import the New Contribution page

class AreaOfStudiesPage extends StatefulWidget {
  const AreaOfStudiesPage({super.key});

  @override
  _AreaOfStudiesPageState createState() => _AreaOfStudiesPageState();
}

class _AreaOfStudiesPageState extends State<AreaOfStudiesPage> {
  List<String> studyAreas = [
    "Computer Science",
    "Mathematics",
    "Physics",
    "Engineering",
    "Medicine",
    "Website Design",
    "Philosophy",
    // Add more areas if needed
  ];

  final Map<String, IconData> areaIcons = {
    "Computer Science": Icons.computer,
    "Mathematics": Icons.calculate,
    "Physics": Icons.science,
    "Engineering": Icons.engineering,
    "Medicine": Icons.health_and_safety,
    "Website Design": Icons.web,
    "Philosophy": Icons.psychology,
  };

  List<String> filteredAreas = [];

  @override
  void initState() {
    super.initState();
    filteredAreas = List.from(studyAreas);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Area of Study"),
        backgroundColor: theme.colorScheme.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Add padding between AppBar and Search Bar
          const SizedBox(height: 16),

          // 🔍 Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  filteredAreas =
                      studyAreas
                          .where(
                            (area) => area.toLowerCase().contains(
                              value.toLowerCase(),
                            ),
                          )
                          .toList();
                });
              },
              decoration: InputDecoration(
                hintText: 'Search area...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // 📜 List of Study Areas
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              itemCount: filteredAreas.length,
              itemBuilder: (context, index) {
                final area = filteredAreas[index];

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: Icon(
                      areaIcons[area],
                      color: theme.colorScheme.primary,
                    ),
                    title: Text(
                      area,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.pop(context, area);
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
