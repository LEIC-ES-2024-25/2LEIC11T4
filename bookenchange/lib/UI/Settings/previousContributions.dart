import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:bookenchange/Database/Firebase.dart';
import 'package:bookenchange/UI/Homepage/contributionCard.dart';

class PreviousContributionsPage extends StatelessWidget {
  const PreviousContributionsPage({super.key});

  Future<List<Map<String, dynamic>>> _getUserContributions(String uid) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('contributions')
        .where('iduser', isEqualTo: uid)
        .get();
    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
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

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: contributions.length,
            itemBuilder: (context, index) {
              final item = contributions[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Contribution(
                  images: List<String>.from(item['images'] ?? []),
                  name: item['title'] ?? 'Untitled',
                  condition: item['condition'],
                  institution: item['institution'] ?? 'Unknown',
                ),
              );
            },
          );
        },
      ),
    );
  }
}