// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_book _$bookFromJson(Map<String, dynamic> json) => _book(
  ISBN: json['ISBN'] as String,
  name: json['name'] as String,
  authors: (json['authors'] as List<dynamic>).map((e) => e as String).toList(),
  Publisher: json['Publisher'] as String,
);

Map<String, dynamic> _$bookToJson(_book instance) => <String, dynamic>{
  'ISBN': instance.ISBN,
  'name': instance.name,
  'authors': instance.authors,
  'Publisher': instance.Publisher,
};
