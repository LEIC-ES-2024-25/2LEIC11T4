import 'package:bookenchange/Domain/Models/Book/book.dart';
import 'package:bookenchange/Domain/Models/institution/institution.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Firebase {
  final FirebaseFirestore db;
  final Reference storageRef;
  Firebase(FirebaseFirestore firestore, FirebaseStorage storage)
    : db = firestore,
      storageRef = storage.ref();

  Future<book?> getBookByISBN(String isbn) async {
    final doc =
        await FirebaseFirestore.instance.collection('books').doc(isbn).get();
    if (doc.exists) {
      return book.fromFirestore(doc);
    } else {
      return null;
    }
  }

  //fetch institutions
  Future<List<institution>> getAllInstitutions() async{
    final snapshot=await db.collection('institution').get();
    return snapshot.docs.map((doc)=>institution.fromFirestore(doc)).toList();
  }
  //fetch degree

  Future<List<degree>> getAllDegrees() async{
    final snapshot=await db.collection('degree').get();
    return snapshot.docs.map((doc)=>institution.fromFirestore(doc)).toList();
  }

}
