// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Contribution _$ContributionFromJson(Map<String, dynamic> json) =>
    _Contribution(
      id: json['id'] as String?,
      iduser: json['iduser'] as String?,
      idbook: json['idbook'] as String?,
      description: json['description'] as String,
      condition: $enumDecode(_$ConditionEnumMap, json['condition']),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      bookName: json['name'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$ContributionToJson(_Contribution instance) =>
    <String, dynamic>{
      'id': instance.id,
      'iduser': instance.iduser,
      'idbook': instance.idbook,
      'description': instance.description,
      'condition': _$ConditionEnumMap[instance.condition]!,
      'images': instance.images,
      'name': instance.bookName,
      'username': instance.username,
    };

const _$ConditionEnumMap = {
  Condition.newCondition: 'New',
  Condition.usedCondition: 'Used - Good',
  Condition.damagedCondition: 'Used - Acceptable',
};
