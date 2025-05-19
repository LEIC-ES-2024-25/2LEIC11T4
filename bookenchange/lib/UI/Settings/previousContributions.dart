import 'package:bookenchange/Database/Firebase.dart';
import 'package:bookenchange/UI/NewContribution/newContribution.dart';
import 'package:bookenchange/Domain/Models/Contributions/contribution.dart';
import 'package:bookenchange/UI/Homepage/contributionCard.dart';
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
  List<Map<String, dynamic>> filteredContributions = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchContributions();
  }

  Future<void> fetchContributions() async {
    final snapshot = await firebase.db.collection('contributions').get();
    final List<Contribution> fetchedContributions = [];

    for (var doc in snapshot.docs) {
      final contributionData = doc.data();
      final contribution = Contribution.fromJson(contributionData);

      // Fetch book name
      final bookSnapshot = await firebase.db
          .collection('books')
          .doc(contribution.idbook.toString())
          .get();
      final bookName = bookSnapshot.exists && bookSnapshot.data() != null
          ? (bookSnapshot.data()?['name'] as String? ?? 'Unknown Book')
          : 'Unknown Book';

      // Fetch user name
      final userSnapshot = await firebase.db
          .collection('users')
          .doc(contribution.iduser.toString())
          .get();
      final username = userSnapshot.exists && userSnapshot.data() != null
          ? (userSnapshot.data()?['username'] as String? ?? 'Unknown User')
          : 'Unknown User';

      // Add the contribution with additional data
      fetchedContributions.add(contribution.copyWith(
        bookName: bookName,
        username: username,
      ));
    }

    setState(() {
      contributions = List<Contribution>.from(fetchedContributions).cast<Map<String, dynamic>>();
      filteredContributions = List<Contribution>.from(fetchedContributions).cast<Map<String, dynamic>>();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            : GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 3 / 4,
          ),
          itemCount: contributions.length,
          itemBuilder: (context, index) {
            final contribution = contributions[index];
            return ContributionCard(
              image: (contribution['images'] as List<dynamic>?)?.first ?? 'https://via.placeholder.com/150',
              bookName: contribution['bookName'] ?? 'Unknown Book',
              username: contribution['username'] ?? 'Unknown User',
              contributionId: contribution['id'] ?? '', // Pass the contribution ID
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