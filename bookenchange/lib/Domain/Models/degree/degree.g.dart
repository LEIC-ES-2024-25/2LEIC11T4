// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'degree.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_degree _$degreeFromJson(Map<String, dynamic> json) =>
    _degree(id: (json['id'] as num).toInt(), degree: json['degree'] as String);

Map<String, dynamic> _$degreeToJson(_degree instance) => <String, dynamic>{
  'id': instance.id,
  'degree': instance.degree,
};
