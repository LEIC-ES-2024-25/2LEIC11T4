import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class book with _$book {
  const factory book({
    required String ISBN,
    required String name,
    required String author,
    required String Publisher,
  }) = _book;

  factory book.fromJson(Map<String, Object?> json) => _$bookFromJson(json);

  factory book.fromFirestore(doc) {
    final data = doc.data() as Map<String, dynamic>;
    return book.fromJson(data);
  }

}
