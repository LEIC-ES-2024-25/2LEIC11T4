// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Contribution _$ContributionFromJson(Map<String, dynamic> json) =>
    _Contribution(
      id: (json['id'] as num).toInt(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String,
      condition: $enumDecode(_$ConditionEnumMap, json['condition']),
      institution: json['institution'] as String,
    );

Map<String, dynamic> _$ContributionToJson(_Contribution instance) =>
    <String, dynamic>{
      'id': instance.id,
      'images': instance.images,
      'name': instance.name,
      'condition': _$ConditionEnumMap[instance.condition]!,
      'institution': instance.institution,
    };

const _$ConditionEnumMap = {
  Condition.newCondition: 'newCondition',
  Condition.usedCondition: 'usedCondition',
  Condition.damagedCondition: 'damagedCondition',
};
