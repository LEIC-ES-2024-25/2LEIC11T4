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
    // to change accordingly
  ]; // Initial categories

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Area of Studies"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimary,
          ), // Back button
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Newcontribution()),
            );
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 20),
        itemCount: studyAreas.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor,
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                studyAreas[index],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // You can navigate to a detailed page if needed
              },
            ),
          );
        },
      ),
    );
  }
}
