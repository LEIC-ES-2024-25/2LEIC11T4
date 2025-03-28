import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class createProfile extends StatefulWidget {
  const createProfile({super.key});

  @override
  State<createProfile> createState() => _createProfileState();
}
class _createProfile extends State<_createProfile> {
voide createCollectionAndDocument(required username,required firstName, required lastName,required email,required institution,required degree, required currentYearOf Study) async {



  FirebaseFirestore firestore = FirebaseFirestore.instance;


  CollectionReference users = firestore.collection('users');

  await users.add({
    'First name': ,  // This is a field in the document
    'Last name': ,
    'User Name': ,
    'Email': ,
    'Institution':,
    'Degree':,
    "Current year of study":,

  }).then((docRef) {
    print("Document added with ID: ${docRef.id}");
  }).catchError((error) {
    print("Failed to add document: $error");
  });
}
