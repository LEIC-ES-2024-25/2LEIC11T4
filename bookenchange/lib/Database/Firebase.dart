import 'package:bookenchange/Database/openLibrary.dart';
import 'package:bookenchange/Domain/Models/Book/book.dart';
import 'package:bookenchange/Domain/Models/degree/degree.dart';
import 'package:bookenchange/Domain/Models/institution/institution.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Firebase {
  final api=openLibrary();
  final FirebaseFirestore db;
  final Reference storageRef;
  Firebase(FirebaseFirestore firestore, FirebaseStorage storage)
    : db = firestore,
      storageRef = storage.ref();

  //search book by isbn if not yet present in the firebase  it should make a call to api
  Future<book> getBookByISBN(String isbn) async {
    final doc = await FirebaseFirestore.instance.collection('book').doc(isbn).get();
    if (doc.exists && doc.data()!=null) {
      return book.fromJson(doc.data()!);
    } else {
      book fetched=await api.fetchBookByISBN(isbn);
      await FirebaseFirestore.instance.collection('book').add(fetched.toJson());
      return fetched;
    }
  }

  //fetch institutions
  Future<List<String>> getAllInstitutions() async{
    final snapshot=await db.collection('institution').get();
    return snapshot.docs.map((doc)=>institution.fromJson(doc.data()).institution).toList();
  }
  Future<void> addInstitution(String institutionName) async{
    try {
      List<String> Institutions = await getAllInstitutions();
       if (!Institutions.contains(institutionName)) {
        await db.collection('institution').add({
          'name': institutionName,
        });
        // não é para manter a mensagem
        print('Institution added successfully!');
      }
      else {
        // não é para manter a mensagem
        print('Instituion already on the database.');
      }
    }
     catch (e) {
       // não é para manter a mensagem
      print('Error on adding the Institution: $e');
    }
  }
  //fetch degrees
  Future<List<String>> getAllDegrees() async{
    final snapshot=await db.collection('degree').get();
    return snapshot.docs.map((doc)=>degree.fromJson(doc.data()).degree).toList();
  }



}
