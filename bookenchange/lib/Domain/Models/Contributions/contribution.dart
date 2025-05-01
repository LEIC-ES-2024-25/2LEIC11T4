import 'package:freezed_annotation/freezed_annotation.dart';

part 'contribution.freezed.dart';
part 'contribution.g.dart';

enum Condition { newCondition, usedCondition, damagedCondition }

@freezed
abstract class Contribution with _$Contribution {
  const factory Contribution({
    required int iduser,
    required int idBook,
    required List<String> images,
    required Condition condition,
  }) = _Contribution;

  factory Contribution.fromJson(Map<String, Object?> json) =>
      _$ContributionFromJson(json);


}
