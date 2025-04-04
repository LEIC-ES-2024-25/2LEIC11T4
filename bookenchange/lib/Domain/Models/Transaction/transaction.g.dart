// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_transactions _$transactionsFromJson(Map<String, dynamic> json) =>
    _transactions(
      idcontribution: (json['idcontribution'] as num).toInt(),
      iduser1: (json['iduser1'] as num).toInt(),
      iduser2: (json['iduser2'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$transactionsToJson(_transactions instance) =>
    <String, dynamic>{
      'idcontribution': instance.idcontribution,
      'iduser1': instance.iduser1,
      'iduser2': instance.iduser2,
      'date': instance.date.toIso8601String(),
    };
