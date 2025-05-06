import 'dart:io';

import 'package:bookenchange/Database/openLibrary.dart';
import 'package:bookenchange/Domain/Models/Author/author.dart';
import 'package:bookenchange/Domain/Models/Book/book.dart';
import 'package:bookenchange/Domain/Models/degree/degree.dart';
import 'package:bookenchange/Domain/Models/Users/users.dart';
import 'package:bookenchange/Domain/Models/institution/institution.dart';
import 'package:bookenchange/Logic/Authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Firebase {
  static final Firebase _instance = Firebase();
  final api = openLibrary();
  final FirebaseFirestore db;
  final Reference storageRef;
  final Auth auth = Auth.instance;
  Firebase()
    : db = FirebaseFirestore.instance,
      storageRef = FirebaseStorage.instance.ref();

  static Firebase get instance => _instance;
  //search book by isbn if not yet present in the firebase  it should make a call to api
  Future<Book> getBookByISBN(String isbn) async {
    final doc = await db.collection('books').doc(isbn).get();
    final Book result;
    if (doc.exists && doc.data() != null) {
      result = Book.fromJson(doc.data()!);
      return result;
    }
    result = await api.fetchBookByISBN(isbn);
    await db.collection('books').add(result.toJson());
    return result;
  }

  /*Future<String> searchauthor(String authorcode) async {
    final doc = await db.collection('author').doc(authorcode).get();
    if (doc.exists && doc.data() != null) {
      final data = doc.data();
      return data!['name'];
    }
    Author feetched = await api.fetchAuthor(authorcode);
    await db.collection('author').add(feetched.toJson());
    return feetched.name;
  }

  //this is use for book info ui
  Future<List<String>> getauthors(List<String> authorcode) async {
    List<String> authors = [];
    for (final id in authorcode) {
      authors.add(await searchauthor(id));
    }
    return authors;
  }*/

  //fetch institutions
  Future<String> getInstitution(String institution) async {
    final doc = await db.collection('institution').doc(institution).get();
    return doc.id;
  }

  Future<List<String>> getAllInstitutions() async {
    final snapshot = await db.collection('institution').get();
    return snapshot.docs
        .map((doc) => Institution.fromJson(doc.data()).name)
        .toList();
  }

  //add institution
  Future<void> addInstittion(String inst) async {
    await db.collection('institution').add(Institution(name: inst).toJson());
  }

  //fetch degrees
  Future<String> getdegree(String degree) async {
    final doc = await db.collection('degree').doc(degree).get();
    return doc.id;
  }

  Future<List<String>> getAllDegrees() async {
    final snapshot = await db.collection('degree').get();
    return snapshot.docs
        .map((doc) => Degree.fromJson(doc.data()).degree)
        .toList();
  }

  //add degree
  Future<void> addDegree(String deg) async {
    await db.collection('degree').add(Degree(degree: deg).toJson());
  }

  //add user
  Future<void> addUsers(
    String firstname,
    String lastname,
    String username,
    String institution,
    String degree,
    int yearofStudy,
    File file,
  ) async {
    await uploadProfilePhotos(auth.userid, file);
    String image = await getDownloadURL(auth.userid);
    final String institutionid = await getInstitution(institution);
    final String degreeid = await getdegree(degree);
    await db
        .collection('users')
        .add(
          Users(
            First_name: firstname,
            Last_name: lastname,
            username: username,
            institutionid: institutionid,
            degreeid: degreeid,
            yearofStudy: yearofStudy,
            profileImageUrl: image,
          ).toJson(),
        );
  }

  Future<void> saveOrUpdateUser({
    required String firstname,
    required String lastname,
    required String username,
    required String institution,
    required String degree,
    required int yearofStudy,
    File? file, // optional during update
  }) async {
    final userId = auth.userid;
    String? image;

    if (file != null) {
      await uploadProfilePhotos(userId, file);
      image = await getDownloadURL(userId);
    }

    final String institutionId = await getInstitution(institution);
    final String degreeId = await getdegree(degree);

    final userRef = db.collection('users').doc(userId);

    final userData = Users(
      First_name: firstname,
      Last_name: lastname,
      username: username,
      institutionid: institutionId,
      degreeid: degreeId,
      yearofStudy: yearofStudy,
      profileImageUrl: image, // Can be null on update
    ).toJson();

  // Remove null values (like profileImageUrl if not updated)
    userData.removeWhere((key, value) => value == null);

    await userRef.set(userData, SetOptions(merge: true));
  }


  Future<void> uploadProfilePhotos(String? userid, File file) async {
    await storageRef.child('users/$userid').putFile(file);
  }

  Future<String> getDownloadURL(String? userid) async {
    return await storageRef.child('users/$userid').getDownloadURL();
  }
}
