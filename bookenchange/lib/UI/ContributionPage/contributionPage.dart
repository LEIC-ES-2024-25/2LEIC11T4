import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookPostApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContributionPage(contributionId: 'exampleContributionId'), // Pass a valid contribution ID
    );
  }
}

class ContributionPage extends StatelessWidget {
  final String contributionId;

  const ContributionPage({super.key, required this.contributionId});

  Future<Map<String, dynamic>> fetchContribution() async {
    final doc = await FirebaseFirestore.instance
        .collection('contributions')
        .doc(contributionId)
        .get();

    if (!doc.exists) {
      throw Exception('Contribution not found');
    }

    return doc.data()!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      appBar: AppBar(
        backgroundColor: const Color(0xFF819DD4),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchContribution(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data found'));
          }

          final data = snapshot.data!;
          final username = data['username'] ?? 'Unknown User';
          final title = data['name'] ?? 'No Title';
          final description = data['description'] ?? 'No Description';
          final imageUrl = (data['images'] as List<dynamic>?)?.first ??
              'https://via.placeholder.com/150';

          return SingleChildScrollView(
            child: Column(
              children: [
                // Book Cover
                Container(
                  margin: const EdgeInsets.all(16),
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),

                // Username and Ask Button
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: const Color(0xFF819DD4),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: Color(0xFF819DD4)),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'username: $username',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF819DD4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('ASK'),
                      ),
                    ],
                  ),
                ),

                // Title Section
                Container(
                  color: const Color(0xFF819DD4),
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Title',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      const SizedBox(height: 8),
                      Text(title, style: const TextStyle(color: Colors.black)),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Description Section
                Container(
                  color: const Color(0xFF819DD4),
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Description:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      const SizedBox(height: 8),
                      Text(description,
                          style: const TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}