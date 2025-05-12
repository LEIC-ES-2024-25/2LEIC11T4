import 'package:bookenchange/Logic/Navigation/navigation.dart';
import 'package:bookenchange/Logic/Navigation/transitions.dart';
import 'package:flutter/material.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:bookenchange/Database/Firebase.dart';
import 'package:bookenchange/Domain/Models/Contributions/contribution.dart';
import 'package:bookenchange/Domain/Models/Book/book.dart';
import 'package:bookenchange/Domain/Models/Users/users.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Firebase firebase = Firebase.instance;
  List<Map<String, dynamic>> contributions = [];

  @override
  void initState() {
    super.initState();
    fetchContributions();
  }

  Future<void> fetchContributions() async {
    final snapshot = await firebase.db.collection('contributions').get();
    final List<Map<String, dynamic>> fetchedContributions = [];

    for (var doc in snapshot.docs) {
      final contribution = Contribution.fromJson(doc.data());
      final book = await firebase.getBookByISBN(contribution.idBook.toString());
      final userDoc = await firebase.db.collection('users').doc(contribution.iduser.toString()).get();
      final user = Users.fromJson(userDoc.data()!);

      fetchedContributions.add({
        'bookName': book.name,
        'userName': '${user.First_name} ${user.Last_name}',
        'image': contribution.images.isNotEmpty ? contribution.images[0] : null,
      });
    }

    // Sort by newest to oldest (assuming Firebase stores a timestamp field)
    fetchedContributions.sort((a, b) => b['timestamp'].compareTo(a['timestamp']));

    setState(() {
      contributions = fetchedContributions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text('Contributions'),
        ),
        body: contributions.isEmpty
            ? Center(
          child: Text(
            'No contributions',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        )
            : ListView.builder(
          itemCount: contributions.length,
          itemBuilder: (context, index) {
            final contribution = contributions[index];
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: contribution['image'] != null
                    ? Image.network(contribution['image'], width: 50, height: 50, fit: BoxFit.cover)
                    : Icon(Icons.image_not_supported),
                title: Text(contribution['bookName']),
                subtitle: Text(contribution['userName']),
              ),
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