// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookinfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_bookinfo _$bookinfoFromJson(Map<String, dynamic> json) => _bookinfo(
  ISBN: json['ISBN'] as String,
  name: json['name'] as String,
  authors: (json['authors'] as List<dynamic>).map((e) => e as String).toList(),
  Publisher: json['Publisher'] as String,
);

Map<String, dynamic> _$bookinfoToJson(_bookinfo instance) => <String, dynamic>{
  'ISBN': instance.ISBN,
  'name': instance.name,
  'authors': instance.authors,
  'Publisher': instance.Publisher,
};
