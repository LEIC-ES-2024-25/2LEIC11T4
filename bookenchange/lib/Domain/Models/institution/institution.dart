import 'package:freezed_annotation/freezed_annotation.dart';

part 'institution.freezed.dart';
part 'institution.g.dart';

@freezed
class institution with _$institution{
  const factory institution({
    required int id,
    required String institution,
  }) = _institution;

  factory institution.fromJson(Map<String, Object?> json) => _$institutionFromJson(json);

}
