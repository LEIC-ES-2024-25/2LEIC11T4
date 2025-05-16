// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Contribution _$ContributionFromJson(Map<String, dynamic> json) =>
    _Contribution(
      uid: json['uid'] as String,
      isbn: json['isbn'] as String,
      condition: json['condition'] as String,
      degree: json['degree'] as String,
      institution: json['institution'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ContributionToJson(_Contribution instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'isbn': instance.isbn,
      'condition': instance.condition,
      'degree': instance.degree,
      'institution': instance.institution,
      'images': instance.images,
    };
