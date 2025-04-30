import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
abstract class Transactions with _$Transactions {
  const factory Transactions({
    required int IdContribution,
    required int IdUser1,
    required int IdUser2,
    required DateTime Date,
  }) = _Transactions;

  factory Transactions.fromJson(Map<String, Object?> json) =>
      _$TransactionsFromJson(json);
}