import 'package:freezed_annotation/freezed_annotation.dart';

part 'contribution.freezed.dart';
part 'contribution.g.dart';


@freezed
abstract class Contribution with _$Contribution {
  const factory Contribution({
    required String uid,
    required String isbn,
    required String description,
    required String condition, // Changed from String to Condition
    required String degree,
    required String institution,
    required List<String> images,
  }) = _Contribution;

  factory Contribution.fromJson(Map<String, Object?> json) =>
      _$ContributionFromJson(json);
}