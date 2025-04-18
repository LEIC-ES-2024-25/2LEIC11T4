// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_users _$usersFromJson(Map<String, dynamic> json) => _users(
  id: (json['id'] as num).toInt(),
  First_name: json['First_name'] as String,
  Last_name: json['Last_name'] as String,
  username: json['username'] as String,
  institutionid: (json['institutionid'] as num).toInt(),
  degreeid: (json['degreeid'] as num).toInt(),
  yearofStudy: (json['yearofStudy'] as num).toInt(),
);

Map<String, dynamic> _$usersToJson(_users instance) => <String, dynamic>{
  'id': instance.id,
  'First_name': instance.First_name,
  'Last_name': instance.Last_name,
  'username': instance.username,
  'institutionid': instance.institutionid,
  'degreeid': instance.degreeid,
  'yearofStudy': instance.yearofStudy,
};
