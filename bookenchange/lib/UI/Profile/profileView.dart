import 'package:flutter/material.dart';
import 'package:bookenchange/Database/Firebase.dart';
import 'package:bookenchange/UI/Settings/previousContributions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class OtherUserProfilePage extends StatelessWidget {
  final String userId;

  const OtherUserProfilePage({super.key, required this.userId, required String userid});

  Future<Map<String, dynamic>?> _getUserData() async {
    final doc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return doc.data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: _getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data;

          if (data == null) {
            return const Center(child: Text("User not found."));
          }

          final username = data['username'] ?? '';
          final profileImageUrl = data['profileImageUrl'] ?? '';
          final degreeId = data['degreeid'];
          final institutionId = data['institutionid'];

          return FutureBuilder<List<String>>(
            future: Future.wait([
              Firebase.instance.getdegree(degreeId),
              Firebase.instance.getInstitution(institutionId),
            ]),
            builder: (context, detailsSnapshot) {
              if (!detailsSnapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final degree = detailsSnapshot.data![0];
              final institution = detailsSnapshot.data![1];

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: profileImageUrl.isNotEmpty
                              ? NetworkImage(profileImageUrl)
                              : const AssetImage('assets/default_avatar.png') as ImageProvider,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(username, style: Theme.of(context).textTheme.titleLarge),
                              const SizedBox(height: 4),
                              Text("Degree: $degree"),
                              Text("Institution: $institution"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}