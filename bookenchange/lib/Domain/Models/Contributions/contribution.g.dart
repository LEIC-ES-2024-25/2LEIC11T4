// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Contribution _$ContributionFromJson(Map<String, dynamic> json) =>
    _Contribution(
      iduser: (json['iduser'] as num).toInt(),
      idBook: (json['idBook'] as num).toInt(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      condition: $enumDecode(_$ConditionEnumMap, json['condition']),
    );

Map<String, dynamic> _$ContributionToJson(_Contribution instance) =>
    <String, dynamic>{
      'iduser': instance.iduser,
      'idBook': instance.idBook,
      'images': instance.images,
      'condition': _$ConditionEnumMap[instance.condition]!,
    };

const _$ConditionEnumMap = {
  Condition.newCondition: 'newCondition',
  Condition.usedCondition: 'usedCondition',
  Condition.damagedCondition: 'damagedCondition',
};
