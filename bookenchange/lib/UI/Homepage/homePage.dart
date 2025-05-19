import 'package:flutter/material.dart';
import 'package:bookenchange/Database/Firebase.dart';
import 'package:bookenchange/Domain/Models/Contributions/contribution.dart';
import 'package:bookenchange/UI/Homepage/contributionCard.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:bookenchange/Logic/Navigation/navigation.dart';
import 'package:bookenchange/Logic/Navigation/transitions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Firebase firebase = Firebase.instance;
  List<Contribution> contributions = [];
  List<Contribution> filteredContributions = [];
  final TextEditingController searchController = TextEditingController();

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
      contributions = fetchedContributions;
      filteredContributions = fetchedContributions;
    });
  }

  void filterContributions(String query) {
    setState(() {
      filteredContributions = contributions
          .where((contribution) =>
      contribution.bookName?.toLowerCase().contains(query.toLowerCase()) ?? false)
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          toolbarHeight: 80.0,
          title: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Search contributions...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              style: const TextStyle(color: Colors.black),
              onChanged: filterContributions,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CustomPageRoute(destination: Navigation.profile),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: fetchContributions,
          child: filteredContributions.isEmpty
              ? Center(
            child: Text(
              'No contributions available',
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
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
                color: Theme.of(context).colorScheme.secondary,
              ),
              label: S.of(context).chat,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.secondary,
              ),
              label: S.of(context).settings,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.secondary,
              ),
              label: S.of(context).new_contribution,
            ),
          ],
          currentIndex: 0,
          onTap: (index) {
            Navigator.push(
              context,
              CustomPageRoute(destination: Navigation.values[index]),
            );
          },
        ),
      ),
    );
  }
}