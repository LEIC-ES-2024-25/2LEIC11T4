import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookenchange/generated/l10n.dart';

class PreviousContributionsPage extends StatelessWidget {
  const PreviousContributionsPage({super.key});

  Future<List<Map<String, dynamic>>> _getUserContributions(String uid) async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('contributions')
            .where('iduser', isEqualTo: uid)
            .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Widget _buildContributionCard(Map<String, dynamic> contributionData) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Contribution image (display the first image if available)
          Expanded(
            child:
                (contributionData['images'] != null &&
                        (contributionData['images'] as List).isNotEmpty)
                    ? Image.network(
                      (contributionData['images'] as List).first ?? '',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )
                    : const SizedBox.shrink(), // Or a placeholder if no image
          ),
          // Title
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
            child: Text(
              contributionData['title'] ?? '',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 2, // Limit title to two lines
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Condition
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
            child: Text(
              contributionData['condition'] ?? '',
              style: const TextStyle(fontSize: 14),
            ),
          ),
          // Institution
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Text(
              contributionData['institution'] ?? 'Unknown',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(child: Text("No user logged in.")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).previous_contributions,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _getUserContributions(uid),
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("Failed to load contributions."));
          }

          final contributions = snapshot.data!;

          if (contributions.isEmpty) {
            return const Center(child: Text("No contributions found."));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: contributions.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 columns
              mainAxisSpacing: 8, // vertical spacing
              crossAxisSpacing: 8, // horizontal spacing
              childAspectRatio:
                  0.75, // Adjust to taste, slightly taller for more info
            ),
            itemBuilder: (context, index) {
              return _buildContributionCard(contributions[index]);
            },
          );
        },
      ),
    );
  }
}
