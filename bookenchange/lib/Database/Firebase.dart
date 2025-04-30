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
  Future<Book> getBookByISBN(String isbn) async {
    final doc = await FirebaseFirestore.instance.collection('books').doc(isbn).get();
    if (doc.exists && doc.data()!=null) {
      return Book.fromJson(doc.data()!);
    } else {
      Book fetched=await api.fetchBookByISBN(isbn);
      await FirebaseFirestore.instance.collection('books').add(fetched.toJson());
      return fetched;
    }
  }

  //fetch institutions
  Future<List<String>> getAllInstitutions() async{
    final snapshot=await db.collection('institution').get();
    return snapshot.docs.map((doc)=>Institution.fromJson(doc.data()).institution).toList();
  }
  Future<void> addInstittion() async{

  }
  //fetch degrees
  Future<List<String>> getAllDegrees() async{
    final snapshot=await db.collection('degree').get();
    return snapshot.docs.map((doc)=>Degree.fromJson(doc.data()).degree).toList();
  }

  Future<Map<String, dynamic>?> getCurrentUserInfo(String uid) async {
  final userDoc = await db.collection('users').doc(uid).get();
  if (!userDoc.exists) return null;

  final data = userDoc.data();
  if (data == null) return null;

  final institutionSnap = await db.collection('institution').doc(data['institutionId']).get();
  final degreeSnap = await db.collection('degree').doc(data['degreeId']).get();

  return {
    'username': data['username'],
    'institution': institutionSnap.data()?['institution'] ?? 'Unknown',
    'degree': degreeSnap.data()?['degree'] ?? 'Unknown',
  };
}

}
