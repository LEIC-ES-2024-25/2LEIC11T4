import 'package:bookenchange/Database/Firebase.dart';
import 'package:bookenchange/UI/NewContribution/newContribution.dart';
import 'package:bookenchange/UI/Homepage/contributionCard.dart' as UIContribution;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PreviousContributionsPage extends StatefulWidget {
  const PreviousContributionsPage({super.key});

  @override
  State<PreviousContributionsPage> createState() =>
      _PreviousContributionsPageState();
}

class _PreviousContributionsPageState extends State<PreviousContributionsPage> {
  final Firebase firebase = Firebase.instance;
  List<Map<String, dynamic>> contributions = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserContributions();
  }

  Future<void> fetchUserContributions() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      final snapshot = await firebase.db
          .collection('contributions')
          .where('iduser', isEqualTo: uid)
          .get();
      setState(() {
        contributions = snapshot.docs.map((doc) => doc.data()).toList();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userName = FirebaseAuth.instance.currentUser?.displayName ?? "User";

    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : contributions.isEmpty
            ? Center(
          child: Text(
            "There are no contributions for $userName",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        )
            : ListView.builder(
          itemCount: contributions.length,
          itemBuilder: (context, index) {
            final contribution = contributions[index];
            return UIContribution.Contribution(
              images: contribution['images'] ?? [],
              name: contribution['description'] ?? '',
              condition: contribution['condition'] ?? '',
              institution: contribution['institution'] ?? '',
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const newContribution()),
            );
          },
          child: const Icon(Icons.add),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}