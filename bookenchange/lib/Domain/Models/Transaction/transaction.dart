import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class transactions with _$transactions {
  const factory transactions({
    required int idcontribution,
    required int iduser1,
    required int iduser2,
    required DateTime date,
  }) = _transactions;

  factory transactions.fromJson(Map<String, Object?> json) =>
      _$transactionsFromJson(json);


}
