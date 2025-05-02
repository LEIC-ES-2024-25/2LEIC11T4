import 'package:freezed_annotation/freezed_annotation.dart';

part 'contribution.freezed.dart';
part 'contribution.g.dart';

enum Condition { newCondition, usedCondition, damagedCondition }

@freezed
abstract class Contribution with _$Contribution {
  const factory Contribution({
    required int iduser,
    required int idBook,
    required String description,
    required Condition condition, // Changed from String to Condition
    required String area,
    required String university,
    required List<String> images,
  }) = _Contribution;

  factory Contribution.fromJson(Map<String, Object?> json) =>
      _$ContributionFromJson(json);
}