import 'package:flutter/material.dart';
import 'NewContribution.dart'; // Import the New Contribution page

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
          icon: Icon(
            Icons.arrow_back,
            color: theme.colorScheme.onPrimary,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Newcontribution(),
              ),
              // ⚠️ Alternative option: If your app already has NewContribution in the stack,
              // you could also use Navigator.pop(context); instead.
            );
          },
        ),
      ),
      body: Column(
        children: [
          // ✅ Add padding between AppBar and Search Bar
          const SizedBox(height: 16),

          // 🔍 Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  filteredAreas = studyAreas
                      .where((area) =>
                          area.toLowerCase().contains(value.toLowerCase()))
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

                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        theme.colorScheme.primary,
                        theme.colorScheme.secondary
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: theme.shadowColor,
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Icon(
                      areaIcons[area],
                      color: theme.colorScheme.onPrimary,
                    ),
                    title: Text(
                      area,
                      style: theme.textTheme.bodyMedium,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // When ready to send data back:
                      // Navigator.pop(context, area);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Newcontribution(),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
