import 'package:flutter/material.dart';
import 'package:bookenchange/Database/Firebase.dart';
import 'package:bookenchange/Domain/Models/Contributions/contribution.dart';
import 'package:bookenchange/UI/Homepage/contributionCard.dart';
import 'package:bookenchange/generated/l10n.dart';

class PreviousContributionsPage extends StatefulWidget {
  const PreviousContributionsPage({super.key});

  @override
  State<PreviousContributionsPage> createState() =>
      _PreviousContributionsPageState();
}

class _PreviousContributionsPageState extends State<PreviousContributionsPage> {
  final Firebase firebase = Firebase.instance;
  List<Contribution> contributions = [];
  List<Contribution> filteredContributions = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchContributions();
  }

  Future<Contribution> enrichContributionData(Firebase firebase, Map<String, dynamic> contributionData, String docId) async {
    String bookName = 'Unknown Book';
    String username = 'Unknown User';

    // Fetch book name using idbook
    if (contributionData['bookId'] != null) {
      try {
        final bookSnapshot = await firebase.db
            .collection('books')
            .doc(contributionData['bookId'].toString())
            .get();

        if (bookSnapshot.exists) {
          bookName = bookSnapshot.data()?['name'] as String? ?? 'Unknown Book';
        }
      } catch (e) {
        debugPrint('Error fetching book for idbook ${contributionData['bookId']}: $e');
      }
    }

    // Fetch username using iduser
    if (contributionData['iduser'] != null) {
      try {
        final userSnapshot = await firebase.db
            .collection('users')
            .doc(contributionData['iduser'].toString())
            .get();

        if (userSnapshot.exists) {
          username = userSnapshot.data()?['username'] as String? ?? 'Unknown User';
        }
      } catch (e) {
        debugPrint('Error fetching user for iduser ${contributionData['iduser']}: $e');
      }
    }

    // Add additional fields to the contribution data
    contributionData['bookName'] = bookName;
    contributionData['username'] = username;

    // Convert to Contribution object and include the document ID
    return Contribution.fromJson(contributionData).copyWith(id: docId);
  }

  Future<void> fetchContributions() async {
    try {
      final userId = firebase.auth.userid;
      final snapshot = await firebase.db
          .collection('contributions')
          .where('iduser', isEqualTo: userId)
          .get();

      final List<Contribution> fetchedContributions = [];
      for (var doc in snapshot.docs) {
        final contributionData = doc.data();
        final enrichedContribution = await enrichContributionData(firebase, contributionData, doc.id);
        fetchedContributions.add(enrichedContribution);
      }

      setState(() {
        contributions = fetchedContributions;
        filteredContributions = fetchedContributions;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching contributions: $e')),
      );
    }
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
            : filteredContributions.isEmpty
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
          itemCount: filteredContributions.length,
          itemBuilder: (context, index) {
            final contribution = filteredContributions[index];
            return ContributionCard(
              image: contribution.images.isNotEmpty
                  ? contribution.images.first
                  : 'https://via.placeholder.com/150',
              bookName: contribution.bookName ?? 'Unknown Book',
              username: contribution.username ?? 'Unknown User',
              contributionId: contribution.id ?? '',
            );
          },
        ),
      ),
    );
  }
}