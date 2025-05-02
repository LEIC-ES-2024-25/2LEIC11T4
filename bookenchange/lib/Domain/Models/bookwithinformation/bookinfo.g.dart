// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookinfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Bookinfo _$BookinfoFromJson(Map<String, dynamic> json) => _Bookinfo(
  ISBN: json['ISBN'] as String,
  name: json['name'] as String,
  authors: (json['authors'] as List<dynamic>).map((e) => e as String).toList(),
  Publisher: json['Publisher'] as String,
);

Map<String, dynamic> _$BookinfoToJson(_Bookinfo instance) => <String, dynamic>{
  'ISBN': instance.ISBN,
  'name': instance.name,
  'authors': instance.authors,
  'Publisher': instance.Publisher,
};
