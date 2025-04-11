// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_book _$bookFromJson(Map<String, dynamic> json) => _book(
  ISBN: json['ISBN'] as String,
  name: json['name'] as String,
  author: json['author'] as String,
  Publisher: json['Publisher'] as String,
  idAreaOfStudy: (json['idAreaOfStudy'] as num).toInt(),
);

Map<String, dynamic> _$bookToJson(_book instance) => <String, dynamic>{
  'ISBN': instance.ISBN,
  'name': instance.name,
  'author': instance.author,
  'Publisher': instance.Publisher,
  'idAreaOfStudy': instance.idAreaOfStudy,
};
