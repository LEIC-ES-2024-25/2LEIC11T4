import 'dart:io';

import 'package:bookexchange/Database/openLibrary.dart';
import 'package:bookexchange/Domain/Models/Author/author.dart';
import 'package:bookexchange/Domain/Models/Book/book.dart';
import 'package:bookexchange/Domain/Models/degree/degree.dart';
import 'package:bookexchange/Domain/Models/Users/users.dart';
import 'package:bookexchange/Domain/Models/institution/institution.dart';
import 'package:bookexchange/Logic/Authentication.dart';
import 'package:bookexchange/UI/Login/logIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Firebase {
  static Firebase instance = Firebase();
  final api = openLibrary();
  final FirebaseFirestore db;
  final Reference storageRef;
  final Auth auth = Auth.instance;
  Firebase()
    : db = FirebaseFirestore.instance,
      storageRef = FirebaseStorage.instance.ref();

  //search book by isbn if not yet present in the firebase  it should make a call to api
  Future<Book> getBookByISBN(String isbn) async {
    final fetchedBook = await api.fetchBookByISBN(isbn);
    final bookId = fetchedBook.bookId;

    final querySnapshot = await db.collection('books').where("bookId", isEqualTo: bookId).get();
    if (querySnapshot.docs.isNotEmpty) {
      return Book.fromJson(querySnapshot.docs.first.data());
    }

    await db.collection('books').doc(bookId).set(fetchedBook.toJson());
    final bookName = fetchedBook.name;

    return fetchedBook;
  }

  Future<Map<String, String>> getFireBaseBook(String isbn) async {
    final fetchedBook = await api.fetchBookByISBN(isbn);
    final bookId = fetchedBook.bookId;
    final bookName = fetchedBook.name;
    return {
      'bookId': bookId,
      'bookName': bookName,
    };
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
  /*Future<void> addUsers(
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
  }*/

  Future<void> logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('remember_me', false);
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login(auth: Auth.instance)),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text('Error logging out: $e'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  Future<String?> showPasswordDialog(BuildContext context) async {
    final TextEditingController passwordController = TextEditingController();
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Re-enter Password'),
        content: TextField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your password',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(null), // Cancel
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(passwordController.text.trim());
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  Future<bool> reauthenticateUser(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user?.email == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No email found for current user.'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    final password = await showPasswordDialog(context);
    if (password == null || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Re-authentication cancelled.'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    final credential = EmailAuthProvider.credential(
      email: user!.email!,
      password: password,
    );

    try {
      await user.reauthenticateWithCredential(credential);
      return true;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Re-authentication failed: ${e.message}'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

    Future<void> deleteAccount(BuildContext context) async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final uid = user.uid;
        await Firebase.instance.deleteUserData(uid);
        await user.delete();
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('remember_me', false);
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Login(auth: Auth.instance)),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Account deleted successfully.'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text('No user is currently logged in.'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        if (e.code == 'requires-recent-login') {
          bool reauthSuccess = await reauthenticateUser(context);
          if (reauthSuccess) {
            await deleteAccount(context); // Retry after re-authentication
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text('Re-authentication failed. Account not deleted.'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        }
          
      } else {

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text('Error deleting account: ${e.message}'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              'An unexpected error occurred while deleting your account.',
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }


    Future<bool> isEmailTaken(String email, {String? excludeUserId}) async {
    final query = db
        .collection('users')
        .where('email', isEqualTo: email);

    final results = await query.get();

    for (final doc in results.docs) {
      if (excludeUserId == null || doc.id != excludeUserId) {
        return true; // Username is taken by someone else
      }
    }

    return false; // Username is available
  }


  Future<bool> isUsernameTaken(String username, {String? excludeUserId}) async {
    final query = db
        .collection('users')
        .where('username', isEqualTo: username);

    final results = await query.get();

    for (final doc in results.docs) {
      if (excludeUserId == null || doc.id != excludeUserId) {
        return true; // Username is taken by someone else
      }
    }

    return false; // Username is available
  }


  Future<void> saveOrUpdateUser({
    required String firstname,
    required String lastname,
    required String username,
    required String email,
    required String institution,
    required String degree,
    required int yearofStudy,
    File? file, // optional during update
  }) async {
    final userId = auth.userid;

    final isTaken = await isUsernameTaken(username, excludeUserId: userId);
    if (isTaken) {
      throw Exception("Username already taken");
    }

    final EmailTaken = await isEmailTaken(email, excludeUserId: userId);
    if (EmailTaken) {
      throw Exception("Email is already in use");
    }

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
      email: email,
      institutionid: institutionId,
      degreeid: degreeId,
      yearofStudy: yearofStudy,
      profileImageUrl: image, // Can be null on update
    ).toJson();

  // Remove null values (like profileImageUrl if not updated)
    userData.removeWhere((key, value) => value == null);

    await userRef.set(userData, SetOptions(merge: true));
  }

  Future<void> deleteUserData(String uid) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).delete();
      await deleteUserChats(uid);
      await deleteUserContributions(uid);

    } catch (e) {
      throw Exception('Failed to delete user data: $e');
    }
  }

  Future<void> deleteUserContributions(String uid) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
        .collection('contributions')
        .where('iduser', isEqualTo: uid)
        .get();

      for (var doc in querySnapshot.docs) {
        await FirebaseFirestore.instance
          .collection('contributions')
          .doc(doc.id)
          .delete();
      }
    } catch (e) {
      throw Exception('Failed to delete user contributions: $e');
    }
  }

  Future<void> deleteUserChats(String uid) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance  
        .collection('chats')
        .where('participants', arrayContains: uid)
        .get();

      for (var doc in querySnapshot.docs) {
        final messageSnapshot = await doc.reference.collection('messages').get();

        for (var msgdoc in messageSnapshot.docs) {
          await msgdoc.reference.delete();
        }

        await doc.reference.delete();
      }
    } catch (e) {
      throw Exception('Failed to delete user chats: $e');
    }
  }


  Future<void> uploadProfilePhotos(String? userid, File file) async {
    await storageRef.child('users/$userid').putFile(file);
  }

  Future<String> getDownloadURL(String? userid) async {
    return await storageRef.child('users/$userid').getDownloadURL();
  }

}


/* class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getUserData() async {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      throw Exception("User not authenticated");
    }

    final userDoc = await _firestore.collection('users').doc(currentUser.uid).get();

    if (!userDoc.exists) {
      throw Exception("User data not found");
    }

    return userDoc.data()!;
  }
}*/