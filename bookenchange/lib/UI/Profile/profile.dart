import 'dart:io';
import 'package:bookenchange/Database/Firebase.dart';
import 'package:bookenchange/UI/Usersetup/dropdownSearch.dart';
import 'package:bookenchange/UI/Usersetup/normalDropdown.dart';
import 'package:bookenchange/UI/Usersetup/simpleFormfields.dart';
import 'package:flutter/material.dart';
import 'package:bookenchange/generated/l10n.dart';
import 'package:file_picker/file_picker.dart' as picker;
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Firebase firebase = Firebase.instance;
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
  String? profileImgUrl;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

 Future<void> loadUserData() async {
    final uid = firebase.auth.userid;
    final doc = await firebase.db.collection('users').doc(uid).get();
    final data = doc.data();

    if (data != null) {
      
      setState(() {
        firstname.text = data['First_name'] ?? '';
        lastname.text = data['Last_name'] ?? '';
        username.text = data['username'] ?? '';
        universityCollege = data['institutionid'];
        degree = data['degreeid'];
        email.text = firebase.auth.currentUser?.email ?? '';
        final rawYear = data['yearofStudy'];
        if (rawYear is int) {
          year = rawYear;
        } else if (rawYear != null) {
          year = int.tryParse(rawYear.toString());
        }
        profileImgUrl = data['profileImageUrl'];
      });
    }
  }

  Future<void> uploadImages() async {
    final status = await Permission.photos.request();
    if (status.isPermanentlyDenied || status.isDenied) {
      await openAppSettings();
    } else {
      final result = await picker.FilePicker.platform.pickFiles(
        type: picker.FileType.image,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        final selectedPath = result.files.single.path!;
        setState(() {
          pickedFiles = File(selectedPath);
          previousImg = selectedPath;
        });
      }
    }
  }

  void _clearFields() {
    setState(() {
      firstname.clear();
      lastname.clear();
      username.clear();
      email.clear();
      universityCollege = null;
      degree = null;
      year = null;
      pickedFiles = null;
      previousImg = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).profile,
            style: Theme.of(context).textTheme.titleMedium,
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
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      if (pickedFiles != null)
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: FileImage(File(pickedFiles!.path)),
                        )
                      else if (profileImgUrl != null && profileImgUrl!.isNotEmpty)
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(profileImgUrl!),
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
                          backgroundColor: Theme.of(context).colorScheme.onError,
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
                        onChanged: (val) => setState(() => year = val),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OutlinedButton(
                              onPressed: _clearFields,
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                "Erase",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            FilledButton(
                              onPressed: () async {
                                
                                if (formKey.currentState!.validate()) {
                                  final newUsername = username.text.trim();
                                  final currentEmail = firebase.auth.currentUser?.email;
                                  final newEmail = email.text.trim();
                                  try {
                                    if (newEmail != currentEmail) {
                                      try {
                                        final emailTaken = await firebase.isEmailTaken(newEmail); 
                                        if (emailTaken) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Email $newEmail is already in use.'),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                          return;
                                        } else {
                                        await firebase.auth.currentUser?.verifyBeforeUpdateEmail(newEmail);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('Verification email sent to $newEmail. Please verify it.'),
                                            backgroundColor: Colors.green,
                                          ),
                                        );
                                        }
                                      } on FirebaseAuthException catch (e) {
                                         String errorMessage;
                                        switch(e.code) {
                                          case 'requires-recent-login':
                                            final reauthSuccess = await firebase.reauthenticateUser(context);
                                            if (reauthSuccess) {
                                              try {
                                                 await firebase.auth.currentUser?.verifyBeforeUpdateEmail(newEmail);
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text('Verification email sent to $newEmail. Please verify it.'),
                                                    backgroundColor: Colors.green,
                                                  ),
                                                );
                                              } on FirebaseAuthException catch (e) {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text('Failed to update email: ${e.message}'),
                                                    backgroundColor: Colors.red,
                                                  ),
                                                );
                                              }
                                            } else {  
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text('Error updating email: ${e.message}'),
                                                  backgroundColor: Colors.red,
                                                ),
                                              );     
                                            }
                                          return;
                                          case 'invalid-email':
                                            errorMessage = 'The email address is badly formatted.';
                                            break;
                                          case 'operation-not-allowed':
                                            errorMessage = 'Email/password accounts are not enabled.';
                                            break;
                                          default:
                                            errorMessage = 'Auth error: ${e.message}';
                                        }
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(errorMessage),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    }
                                    await firebase.saveOrUpdateUser(
                                    firstname: firstname.text.trim(),
                                    lastname: lastname.text.trim(),
                                    username: username.text.trim(),
                                    email: email.text.trim(),
                                    institution: universityCollege!,
                                    degree: degree!,
                                    yearofStudy: year!,
                                    file: pickedFiles,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Profile updated successfully!"), backgroundColor: Colors.green,),
                                  );
                                  } catch (e) {
                                    String errorMessage;
                                    // Check if it's a username conflict
                                    if (e.toString().contains("Username already taken")) {
                                      errorMessage = "Username $newUsername is already taken.";
                                    } else if (e.toString().contains("Email is lready in use")) {
                                      errorMessage = "Email $newEmail is already in use.";
                                    } else {
                                      errorMessage = "An error occurred: $e";
                                    }

                                    ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(errorMessage), backgroundColor: Colors.red,),
                                    );
                                  }
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
                          ],
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