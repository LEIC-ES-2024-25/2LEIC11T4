import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContributionPage extends StatelessWidget {
  final String contributionId;

  const ContributionPage({super.key, required this.contributionId});

  Future<Map<String, dynamic>> fetchContribution() async {
    final doc = await FirebaseFirestore.instance
        .collection('contributions')
        .doc(contributionId)
        .get();

    if (!doc.exists) throw Exception('Contribution not found');

    final data = doc.data()!;
    if (data['iduser'] != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(data['iduser'])
          .get();

      if (userDoc.exists) {
        data['profileImageUrl'] = userDoc.data()?['profileImageUrl'];
      }
    }

    return data;
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
          final isbn = data['isbn'] ?? 'Unknown';
          final condition = data['condition'] ?? 'Unknown';
          final imageUrl = (data['images'] as List<dynamic>?)?.first ??
              'https://via.placeholder.com/150';
          final profileImageUrl = data['profileImageUrl'] ??
              'https://via.placeholder.com/150';

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Book Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageUrl,
                    height: 320,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),

                // Profile and Ask Button
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF819DD4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(profileImageUrl),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          username,
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF819DD4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          // handle ASK action
                        },
                        child: const Text('ASK'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Book Info Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6EAF4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoRow(label: 'Title', value: title),
                      InfoRow(label: 'Condition', value: condition),
                      InfoRow(label: 'ISBN', value: isbn),
                      const SizedBox(height: 12),
                      const Text('Description:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 6),
                      Text(description),
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

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text('$label: ',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black)),
          Expanded(
            child: Text(value, style: const TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}