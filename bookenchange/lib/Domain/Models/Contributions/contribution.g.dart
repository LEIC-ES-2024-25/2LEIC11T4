// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Contribution _$ContributionFromJson(Map<String, dynamic> json) =>
    _Contribution(
      iduser: (json['iduser'] as num).toInt(),
      idbook: (json['idbook'] as num).toInt(),
      description: json['description'] as String,
      condition: $enumDecode(_$ConditionEnumMap, json['condition']),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ContributionToJson(_Contribution instance) =>
    <String, dynamic>{
      'iduser': instance.iduser,
      'idbook': instance.idbook,
      'description': instance.description,
      'condition': _$ConditionEnumMap[instance.condition]!,
      'images': instance.images,
    };

const _$ConditionEnumMap = {
  Condition.newCondition: 'newCondition',
  Condition.usedCondition: 'usedCondition',
  Condition.damagedCondition: 'damagedCondition',
};
