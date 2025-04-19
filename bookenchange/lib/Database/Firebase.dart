import 'package:bookenchange/Database/openLibrary.dart';
import 'package:bookenchange/Domain/Models/Author/author.dart';
import 'package:bookenchange/Domain/Models/Book/book.dart';
import 'package:bookenchange/Domain/Models/Degree/degree.dart';
import 'package:bookenchange/Domain/Models/bookwithinformation/bookinfo.dart';
import 'package:bookenchange/Domain/Models/institution/institution.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Firebase {
  static final Firebase _instance = Firebase();
  final api = openLibrary();
  final FirebaseFirestore db;
  final Reference storageRef;
  Firebase()
    : db = FirebaseFirestore.instance,
      storageRef = FirebaseStorage.instance.ref();

  static Firebase get instance => _instance;
  //search book by isbn if not yet present in the firebase  it should make a call to api
  Future<Bookinfo> getBookByISBN(String isbn) async {
    final doc = await db.collection('books').doc(isbn).get();
    final List<String> authors;
    final Book result;
    if (doc.exists && doc.data() != null) {
      result = Book.fromJson(doc.data()!);
      authors = await getauthors(result.authors);
      return Bookinfo(
        ISBN: result.ISBN,
        name: result.name,
        authors: authors,
        Publisher: result.Publisher,
      );
    }
    result = await api.fetchBookByISBN(isbn);
    authors = await getauthors(result.authors);
    await db.collection('books').add(result.toJson());
    return Bookinfo(
      ISBN: isbn,
      name: result.name,
      authors: authors,
      Publisher: result.Publisher,
    );
  }

  Future<String> searchauthor(String authorcode) async {
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
  }

  //fetch institutions
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
  Future<List<String>> getAllDegrees() async {
    final snapshot = await db.collection('degree').get();
    return snapshot.docs
        .map((doc) => Degree.fromJson(doc.data()).name)
        .toList();
  }

  //add degree
  Future<void> addDegree(String deg) async {
    await db.collection('degree').add(Degree(name: deg).toJson());
  }

  //add user
}
