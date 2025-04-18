import 'package:freezed_annotation/freezed_annotation.dart';

part 'degree.freezed.dart';
part 'degree.g.dart';

@freezed
class degree with _$degree {
  const factory degree({
    required String degree,
  }) = _degree;

  factory degree.fromJson(Map<String, Object?> json) => _$degreeFromJson(json);


}
