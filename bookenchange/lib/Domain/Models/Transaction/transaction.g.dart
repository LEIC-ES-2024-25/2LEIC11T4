// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Transactions _$TransactionsFromJson(Map<String, dynamic> json) =>
    _Transactions(
      IdContribution: (json['IdContribution'] as num).toInt(),
      IdUser1: (json['IdUser1'] as num).toInt(),
      IdUser2: (json['IdUser2'] as num).toInt(),
      Date: DateTime.parse(json['Date'] as String),
    );

Map<String, dynamic> _$TransactionsToJson(_Transactions instance) =>
    <String, dynamic>{
      'IdContribution': instance.IdContribution,
      'IdUser1': instance.IdUser1,
      'IdUser2': instance.IdUser2,
      'Date': instance.Date.toIso8601String(),
    };
