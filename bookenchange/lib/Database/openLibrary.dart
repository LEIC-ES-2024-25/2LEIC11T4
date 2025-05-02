import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bookenchange/Domain/Models/Book/book.dart';

class openLibrary{
  Future<Book> fetchBookByISBN(String isbn) async {
    final url = Uri.parse('https://openlibrary.org/isbn/$isbn.json');

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch book from Open Library');
    }

    final data = json.decode(response.body);

    return Book(
      ISBN: isbn,
      name: data['title'] ?? 'Unknown',
      authors: (data['authors'] != null && data['authors'] is List)
          ? data['authors'][0]['name'] ?? 'Unknown'
          : 'Unknown',
      Publisher: (data['publishers'] != null && data['publishers'] is List)
          ? data['publishers'][0] ?? 'Unknown'
          : 'Unknown',
    );
  }
}