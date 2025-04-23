import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookenchange/Logic/Navigation/navigation.dart';
import 'package:bookenchange/Logic/Navigation/transitions.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:bookenchange/UI/Homepage/homePage.dart';
import 'package:bookenchange/Logic/Authentication.dart';
import 'package:bookenchange/UI/Login/logIn.dart';
import 'package:bookenchange/UI/Settings/settingsPage.dart';

class PreviousContributionsPage extends StatelessWidget {
  const PreviousContributionsPage({super.key});

  Future<List<Map<String, dynamic>>> _getUserContributions() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return [];

    final snapshot = await FirebaseFirestore.instance
        .collection('contributions') // or 'books' based on your setup
        .where('uid', isEqualTo: uid)
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              Navigator.pop(context); // Goes back to HomePage
            },
          ),
          centerTitle: true,
        ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _getUserContributions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No contributions found."));
          }

          final contributions = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: contributions.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Matches your screenshot
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                final item = contributions[index];
                return Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          item['coverUrl'] ?? '',
                          fit: BoxFit.cover,
                          errorBuilder: (context, _, __) =>
                              const Icon(Icons.broken_image),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['title'] ?? 'Untitled',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
