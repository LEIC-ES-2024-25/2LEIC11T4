import 'package:freezed_annotation/freezed_annotation.dart';

part 'contribution.freezed.dart';
part 'contribution.g.dart';

enum Condition { newCondition, usedCondition, damagedCondition }

@freezed
abstract class Contribution with _$Contribution {
  const factory Contribution({
    required int iduser,
    required int idbook,
    required String description,
    required Condition condition, // Changed from String to Condition
    required List<String> images,
  }) = _Contribution;

  factory Contribution.fromJson(Map<String, Object?> json) =>
      _$ContributionFromJson(json);
}