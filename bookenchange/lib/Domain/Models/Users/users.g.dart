// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Users _$UsersFromJson(Map<String, dynamic> json) => _Users(
  First_name: json['First_name'] as String,
  Last_name: json['Last_name'] as String,
  username: json['username'] as String,
  institutionid: (json['institutionid'] as num).toInt(),
  degreeid: (json['degreeid'] as num).toInt(),
  yearofStudy: (json['yearofStudy'] as num).toInt(),
);

Map<String, dynamic> _$UsersToJson(_Users instance) => <String, dynamic>{
  'First_name': instance.First_name,
  'Last_name': instance.Last_name,
  'username': instance.username,
  'institutionid': instance.institutionid,
  'degreeid': instance.degreeid,
  'yearofStudy': instance.yearofStudy,
};
