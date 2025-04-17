import 'package:bookenchange/Logic/Navigation/transitions.dart';
import 'package:bookenchange/UI/Usersetup/simpleFormfields.dart';
import 'package:flutter/material.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:bookenchange/Logic/Navigation/navigation.dart';

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final universityCollege = TextEditingController();
  final degree = TextEditingController();
  final currentYear = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
          centerTitle: true,
        ),
        body: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //blank photo display
                //photograph button
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    reverse: true,
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        normalField(
                          controller: firstname,
                          name: S.of(context).first_name,
                        ),
                        normalField(
                          controller: lastname,
                          name: S.of(context).last_name,
                        ),
                        normalField(
                          controller: username,
                          name: S.of(context).username,
                        ),
                        normalField(
                          controller: email,
                          name: S.of(context).email_hint,
                        ),

                        //search dropdown university/college
                        //search dropdown degree
                        //normal dropdown year
                        //save changes button/cancel
                      ],
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
