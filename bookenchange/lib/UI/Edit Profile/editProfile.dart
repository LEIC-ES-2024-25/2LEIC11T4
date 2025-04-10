import 'package:bookenchange/Logic/Navigation/transitions.dart';
import 'package:flutter/material.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:bookenchange/Logic/Navigation/navigation.dart';

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).profile,
            style:
                Theme.of(
                  context,
                ).textTheme.titleMedium, // Using theme text styles
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                CustomPageRoute(destination: Navigation.home),
              ); // Goes back to HomePage
            },
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              //fetch image from firebase
              //photograph button
              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 320,
                  height: 800,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(children: []),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
