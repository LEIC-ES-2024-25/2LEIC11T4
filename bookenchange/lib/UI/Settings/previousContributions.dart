import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:bookenchange/Database/Firebase.dart';
import 'package:bookenchange/UI/Homepage/contributionCard.dart';

class PreviousContributionsPage extends StatelessWidget {
  const PreviousContributionsPage({super.key});

    Future<Map<String, dynamic>?> _getUserData(String uid) async {
    final userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return userDoc.data();
  }

  Future<List<Map<String, dynamic>>> _getUserContributions(String uid) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('contributions')
        .where('uid', isEqualTo: uid)
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
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
          icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.onPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Future.wait([
          _getUserData(uid),
          _getUserContributions(uid),
        ]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("Failed to load data."));
          }

          final userData = snapshot.data![0] as Map<String, dynamic>?;
          final contributions = snapshot.data![1] as List<Map<String, dynamic>>;

          if (userData == null) {
            return const Center(child: Text("User data not found."));
          }

          final username = userData['username'] ?? 'Unknown';
          final degree = userData['degree'] ?? 'Unknown';
          final college = userData['institution'] ?? 'Unknown';

          return Column(
            children: [
              Container(
                color: Theme.of(context).colorScheme.secondaryContainer,
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Username: $username", style: Theme.of(context).textTheme.bodyLarge),
                    Text("Degree: $degree", style: Theme.of(context).textTheme.bodyMedium),
                    Text("College: $college", style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              Expanded(
                child: contributions.isEmpty
                    ? const Center(child: Text("No contributions found."))
                    : ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: contributions.length,
                        itemBuilder: (context, index) {
                          final item = contributions[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Contribution(
                              images: List<String>.from(item['images'] ?? []),
                              name: item['title'] ?? 'Untitled',
                              condition: item['condition'], // Should be Enum if mapped
                              institution: college,
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
