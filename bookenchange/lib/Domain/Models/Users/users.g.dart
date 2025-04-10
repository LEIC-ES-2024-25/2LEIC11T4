// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_users _$usersFromJson(Map<String, dynamic> json) => _users(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  institution: json['institution'] as String,
);

Map<String, dynamic> _$usersToJson(_users instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'institution': instance.institution,
};
