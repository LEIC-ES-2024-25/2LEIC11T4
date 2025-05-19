// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contribution _$ContributionFromJson(Map<String, dynamic> json) {
  print(
      'Raw JSON data for Contribution: $json'); // Debug print for raw JSON input

  return Contribution(
    iduser: json['iduser'] as String?,
    idbook: json['idbook'] as String?,
    description: json['description'] as String,
    condition: $enumDecode(_$ConditionEnumMap, json['condition']),
    images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    bookName: json['name'] as String?,
    username: json['username'] as String?,
  );
}

Map<String, dynamic> _$ContributionToJson(Contribution instance) {
  final json = <String, dynamic>{
    'iduser': instance.iduser,
    'idbook': instance.idbook,
    'description': instance.description,
    'condition': _$ConditionEnumMap[instance.condition]!,
    'images': instance.images,
    'bookName': instance.bookName,
    'username': instance.username,
  };
  print('Serialized JSON for Contribution: $json'); // Debug print for serialized JSON output
  return json;
}
const _$ConditionEnumMap = {
  Condition.newCondition: 'New',
  Condition.usedCondition: 'Used - Good',
  Condition.damagedCondition: 'Used - Acceptable',
};
