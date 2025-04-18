// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_institution _$institutionFromJson(Map<String, dynamic> json) => _institution(
  id: (json['id'] as num).toInt(),
  institution: json['institution'] as String,
);

Map<String, dynamic> _$institutionToJson(_institution instance) =>
    <String, dynamic>{'id': instance.id, 'institution': instance.institution};
