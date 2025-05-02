import 'package:freezed_annotation/freezed_annotation.dart';

part 'degree.freezed.dart';
part 'degree.g.dart';

@freezed
abstract class Degree with _$Degree {
  const factory Degree({required String name}) = _Degree;

  factory Degree.fromJson(Map<String, dynamic> json) => _$DegreeFromJson(json);
}
