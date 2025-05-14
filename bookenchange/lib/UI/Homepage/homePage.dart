import 'package:flutter/material.dart';
import 'package:bookenchange/Database/Firebase.dart';
import 'package:bookenchange/Domain/Models/Contributions/contribution.dart' as ModelContribution;
import 'package:bookenchange/UI/Homepage/contributionCard.dart' as UIContribution;
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
  List<ModelContribution.Contribution> contributions = [];
  List<ModelContribution.Contribution> filteredContributions = [];
  final TextEditingController searchController = TextEditingController();


  @override
  void initState() {
    super.initState();
    fetchContributions();
  }

  void filterContributions(String query) {
    setState(() {
      filteredContributions = contributions
          .where((contribution) =>
          contribution.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> fetchContributions() async {
    final snapshot = await firebase.db.collection('contributions').get();
    final List<ModelContribution.Contribution> fetchedContributions = snapshot.docs
        .map((doc) => ModelContribution.Contribution.fromJson(doc.data()))
        .toList();

    // Debug line to print fetched contributions
    print('Fetched Contributions: $fetchedContributions');

    setState(() {
      contributions = fetchedContributions;
    });
    @override
    void dispose() {
      searchController.dispose();
      super.dispose();
    }
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
              borderRadius: BorderRadius.circular(20), // Rounded corners
            ),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search contributions...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              style: TextStyle(color: Colors.black),
              onChanged: filterContributions,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                // TODO: Navigate to the profile page when implemented
                // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Same color as the search bar
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.primary, // Same color as the AppBar
                    size: 30.0,
                  ), // Padding inside the circle
                ),
              ),
            ),
          ],
        ),
        body: contributions.isEmpty
            ? Center(
          child: Text(
            'No contributions available',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        )
            : ListView.builder(
          itemCount: contributions.length,
          itemBuilder: (context, index) {
            final contribution = contributions[index];
            return UIContribution.Contribution(
              images: contribution.images,
              name: contribution.description,
              condition: contribution.condition,
              institution: contribution.university,
            );
          },
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