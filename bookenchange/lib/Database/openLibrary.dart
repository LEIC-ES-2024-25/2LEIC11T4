import 'dart:convert';
import 'package:bookenchange/Domain/Models/Author/author.dart';
import 'package:http/http.dart' as http;
import 'package:bookenchange/Domain/Models/Book/book.dart';

class openLibrary {
  Future<Book> fetchBookByISBN(String isbn) async {
  final url = Uri.parse('https://openlibrary.org/isbn/$isbn.json');
  final response = await http.get(url);

  if (response.statusCode != 200) {
    throw Exception('Failed to fetch book from Open Library');
  }

  final data = json.decode(response.body);

  // Title
  final title = data['title'] ?? 'Unknown';


  List<String> authors = [];
  if (data['authors'] != null && data['authors'] is List) {
    for (var authorRef in data['authors']) {
      final authorKey = authorRef['key'];
      if (authorKey != null) {
        final authorResponse = await http.get(
          Uri.parse('https://openlibrary.org/$authorKey.json'),
        );
        if (authorResponse.statusCode == 200) {
          final authorData = json.decode(authorResponse.body);
          final name = authorData['name'];
          if (name != null) {
            authors.add(name);
          }
        }
      }
    }
  }

  // Publishers
  List<String> publishers = [];
  if (data['publishers'] != null && data['publishers'] is List) {
    publishers = List<String>.from(data['publishers']);
  }

  return Book(
    ISBN: isbn,
    name: title,
    authors: authors,
    publishers: publishers,
  );
}

}
