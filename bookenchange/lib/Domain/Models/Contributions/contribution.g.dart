// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contribution _$ContributionFromJson(Map<String, dynamic> json) => Contribution(
  iduser: (json['iduser'] as num?)?.toInt(),
  idbook: (json['idbook'] as num?)?.toInt(),
  description: json['description'] as String,
  condition: $enumDecode(_$ConditionEnumMap, json['condition']),  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  bookName: json['bookName'] as String?,
  username: json['username'] as String?,
);

Map<String, dynamic> _$ContributionToJson(Contribution instance) =>
    <String, dynamic>{
      'iduser': instance.iduser,
      'idbook': instance.idbook,
      'description': instance.description,
      'condition': _$ConditionEnumMap[instance.condition]!,
      'images': instance.images,
      'bookName': instance.bookName,
      'username': instance.username,
    };

const _$ConditionEnumMap = {
  Condition.newCondition: 'New',
  Condition.usedCondition: 'Used - Good',
  Condition.damagedCondition: 'Used - Acceptable',
};
