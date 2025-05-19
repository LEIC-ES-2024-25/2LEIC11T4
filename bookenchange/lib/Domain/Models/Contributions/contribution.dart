import 'package:json_annotation/json_annotation.dart';

part 'contribution.g.dart';

@JsonSerializable()
class Contribution {
  final int? iduser;
  final int? idbook;
  final String description;
  final Condition condition;
  final List<String> images;
  final String? bookName; // Optional field
  final String? username; // Optional field

  Contribution({
    required this.iduser,
    required this.idbook,
    required this.description,
    required this.condition,
    required this.images,
    this.bookName,
    this.username,
  });

  factory Contribution.fromJson(Map<String, dynamic> json) =>
      _$ContributionFromJson(json);

  Map<String, dynamic> toJson() => _$ContributionToJson(this);

  Contribution copyWith({
    String? bookName,
    String? username,
  }) {
    return Contribution(
      iduser: iduser,
      idbook: idbook,
      description: description,
      condition: condition,
      images: images,
      bookName: bookName ?? this.bookName,
      username: username ?? this.username,
    );
  }
}

enum Condition {
  @JsonValue('New')
  newCondition,
  @JsonValue('Used - Good')
  usedCondition,
  @JsonValue('Used - Acceptable')
  damagedCondition,
}