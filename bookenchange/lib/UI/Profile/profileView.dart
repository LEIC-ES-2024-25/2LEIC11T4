import 'package:flutter/material.dart';
import 'package:bookexchange/Database/Firebase.dart';
import 'package:bookexchange/Domain/Models/Contributions/contribution.dart';
import 'package:bookexchange/UI/Homepage/contributionCard.dart';

import '../ContributionPage/contributionPage.dart';

class ProfileView extends StatefulWidget {
  final String userId;

  const ProfileView({super.key, required this.userId});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final Firebase firebase = Firebase.instance;
  Map<String, dynamic>? userData;
  List<Contribution> userContributions = [];
  List<Contribution> filteredContributions = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
    fetchUserContributions();
  }

  Future<void> fetchUserData() async {
    try {
      final doc = await firebase.db.collection('users').doc(widget.userId).get();
      if (doc.exists) {
        setState(() {
          userData = doc.data();
        });
      }
    } catch (e) {
      debugPrint('Error fetching user data: $e');
    }
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

  Future<void> fetchUserContributions() async {
    try {
      final snapshot = await firebase.db
          .collection('contributions')
          .where('iduser', isEqualTo: widget.userId)
          .get();

      final List<Contribution> fetchedContributions = [];
      for (var doc in snapshot.docs) {
        final contributionData = doc.data();
        final enrichedContribution = await enrichContributionData(firebase, contributionData, doc.id);
        fetchedContributions.add(enrichedContribution);
      }

      setState(() {
        userContributions = fetchedContributions;
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Error fetching user contributions: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  void filterContributions(String query) {
    setState(() {
      filteredContributions = userContributions
          .where((contribution) =>
      contribution.bookName?.toLowerCase().contains(query.toLowerCase()) ?? false)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: theme.colorScheme.primary,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : userData == null
          ? const Center(child: Text('User data not found'))
          : RefreshIndicator(
        onRefresh: fetchUserContributions,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // User Top Bar
              Container(
                padding: const EdgeInsets.all(16),
                color: theme.colorScheme.primary,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: userData?['profileImageUrl'] != null
                          ? NetworkImage(userData!['profileImageUrl'])
                          : null,
                      child: userData?['profileImageUrl'] == null
                          ? Icon(Icons.person,
                          size: 40,
                          color: theme.colorScheme.onPrimary)
                          : null,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${userData?['First_name'] ?? ''} ${userData?['Last_name'] ?? ''}',
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                          Text(
                            'Username: ${userData?['username'] ?? 'Unknown Username'}',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                          Text(
                            'Institution: ${userData?['institutionid'] ?? 'Unknown University'}',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                          Text(
                            'Degree: ${userData?['degreeid'] ?? 'Unknown Degree'}',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // User Contributions
              userContributions.isEmpty
                  ? Center(
                child: Text(
                  'No contributions available',
                  style: theme.textTheme.bodyLarge,
                ),
              )
                  : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(8.0),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: userContributions.length,
                itemBuilder: (context, index) {
                  final contribution = userContributions[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContributionPage(
                            contributionId: contribution.id ?? '',
                          ),
                        ),
                      );
                    },
                    child: ContributionCard(
                      image: contribution.images.isNotEmpty
                          ? contribution.images.first
                          : 'https://via.placeholder.com/150',
                      bookName:
                      contribution.bookName ?? 'Unknown Book',
                      username:
                      contribution.username ?? 'Unknown User',
                      contributionId: contribution.id ?? '',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}