// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Contribution _$ContributionFromJson(Map<String, dynamic> json) =>
    _Contribution(
      iduser: (json['iduser'] as num).toInt(),
      idBook: (json['idBook'] as num).toInt(),
      description: json['description'] as String,
      condition: json['condition'] as String,
      area: json['area'] as String,
      university: json['university'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ContributionToJson(_Contribution instance) =>
    <String, dynamic>{
      'iduser': instance.iduser,
      'idBook': instance.idBook,
      'description': instance.description,
      'condition': instance.condition,
      'area': instance.area,
      'university': instance.university,
      'images': instance.images,
    };
