import 'package:bookenchange/Database/Firebase.dart';
import 'package:bookenchange/UI/NewContribution/newContribution.dart';
import 'package:bookenchange/UI/Homepage/contributionCard.dart' as UIContribution;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookenchange/generated/l10n.dart';

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
    print('Username : $userName');

    return SafeArea(
      child: Scaffold(
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
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : contributions.isEmpty
            ? Center(
          child: Text(
            "There are no contributions from user yet.",
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