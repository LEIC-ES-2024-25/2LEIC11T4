import 'package:bookenchange/Database/Firebase.dart';
import 'package:bookenchange/UI/Usersetup/dropdownSearch.dart';
import 'package:bookenchange/UI/Usersetup/simpleFormfields.dart';
import 'package:flutter/material.dart';
import 'package:bookenchange/generated/l10n.dart';

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  final firebase = Firebase.instance;
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
        body:SingleChildScrollView(
          reverse: true,
          child:Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //blank photo display
              //photograph button
              Padding(padding: EdgeInsets.all(50)),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
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

                      dropdownSearch(
                        get: firebase.getAllInstitutions,
                        add: firebase.addInstittion,
                        name: S.of(context).university_college,
                      ),
                      dropdownSearch(get: firebase.getAllDegrees, add: firebase.addDegree, name:S.of(context).degree),
                      //normal dropdown year
                      //save changes button/cancel
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
