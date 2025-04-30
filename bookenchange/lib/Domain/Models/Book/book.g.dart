// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Book _$BookFromJson(Map<String, dynamic> json) => _Book(
  ISBN: json['ISBN'] as String,
  name: json['name'] as String,
  author: json['author'] as String,
  Publisher: json['Publisher'] as String,
);

Map<String, dynamic> _$BookToJson(_Book instance) => <String, dynamic>{
  'ISBN': instance.ISBN,
  'name': instance.name,
  'author': instance.author,
  'Publisher': instance.Publisher,
};
