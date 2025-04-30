import 'package:freezed_annotation/freezed_annotation.dart';

part 'institution.freezed.dart';
part 'institution.g.dart';

@freezed
 abstract class Institution with _$Institution{
  const factory Institution({
    required String institution,
  }) = _Institution;

  factory Institution.fromJson(Map<String, Object?> json) => _$InstitutionFromJson(json);

}
