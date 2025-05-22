import 'package:freezed_annotation/freezed_annotation.dart';

part 'contribution.freezed.dart';
part 'contribution.g.dart';

enum Condition {
  @JsonValue('New')
  newCondition,

  @JsonValue('Used - Good')
  usedCondition,

  @JsonValue('Used - Acceptable')
  damagedCondition,
}

@freezed
abstract class Contribution with _$Contribution {
  const factory Contribution({
    String? id,
    String? iduser,
    String? idbook,
    required String description,
    required Condition condition,
    required List<String> images,

    @JsonKey(name: 'name') String? bookName, // 🔥 Map Firestore field "name" to Dart's "bookName"
    String? username,
  }) = _Contribution;

  factory Contribution.fromJson(Map<String, dynamic> json) => _$ContributionFromJson(json);
}
