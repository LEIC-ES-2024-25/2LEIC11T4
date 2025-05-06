import 'dart:io';
import 'package:bookenchange/Logic/Navigation/transitions.dart';
import 'package:bookenchange/Database/Firebase.dart';
import 'package:bookenchange/Logic/Navigation/navigation.dart';
import 'package:bookenchange/UI/Usersetup/dropdownSearch.dart';
import 'package:bookenchange/UI/Usersetup/normalDropdown.dart';
import 'package:bookenchange/UI/Usersetup/simpleFormfields.dart';
import 'package:flutter/material.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:file_picker/file_picker.dart' as picker;
import 'package:permission_handler/permission_handler.dart';

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
  String? universityCollege;
  String? degree;
  int? year;
  final formKey = GlobalKey<FormState>();
  File? pickedFiles;
  String? previousImg;

  Future<void> uploadImages() async {
    final status = await Permission.photos.request();

    if (status.isPermanentlyDenied || status.isDenied) {
      await openAppSettings(); // Open app settings using permission_handler
    } else {
      final result = await picker.FilePicker.platform.pickFiles(
        type: picker.FileType.image,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        final selectedPath = result.files.single.path!;

        if (selectedPath != previousImg) {
          setState(() {
            pickedFiles = File(selectedPath);
            previousImg = selectedPath;
          });
        }
      }
    }
  }

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
        body: SingleChildScrollView(
          reverse: true,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      if (pickedFiles != null)
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: FileImage(File(pickedFiles!.path)),
                        )
                      else
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Theme.of(context).indicatorColor,
                          child: Icon(
                            Icons.person,
                            size: 48,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      Positioned(
                        top: 75,
                        bottom: 0,
                        right: 0,
                        child: FloatingActionButton(
                          onPressed: () => uploadImages(),
                          elevation: 0,
                          highlightElevation: 0,
                          mini: true,
                          backgroundColor:
                              Theme.of(context).colorScheme.onError,
                          shape: CircleBorder(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1,
                            ),
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                        selected: universityCollege,
                        onChanged: (val) {
                          setState(() {
                            universityCollege = val;
                          });
                        },
                      ),
                      dropdownSearch(
                        get: firebase.getAllDegrees,
                        add: firebase.addDegree,
                        name: S.of(context).degree,
                        selected: degree,
                        onChanged: (val) {
                          setState(() {
                            degree = val;
                          });
                        },
                      ),
                      normalDropdown(
                        years: [1, 2, 3, 4, 5, 6],
                        label: S.of(context).current_year,
                        selected: year,
                        onChanged: (val) {
                          setState(() {
                            year = val;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: FilledButton(
                          onPressed:  () async {
                            if (formKey.currentState!.validate()) {
                              await firebase.saveOrUpdateUser(
                                firstname: firstname.text.trim(),
                                lastname: lastname.text.trim(),
                                username: username.text.trim(),
                                institution: universityCollege!,
                                degree: degree!,
                                yearofStudy: year!,
                                file: pickedFiles, // optional, only if changed
                              );

                                Navigator.push(
                                  context,
                                  CustomPageRoute(destination: Navigation.home),
                              );
                            }
                          },    
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Theme.of(context).indicatorColor,
                          ),
                          child: Text(
                            S.of(context).save,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
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

  @override
  void dispose() {
    super.dispose();
    firstname.dispose();
    lastname.dispose();
    username.dispose();
    email.dispose();
  }
}
