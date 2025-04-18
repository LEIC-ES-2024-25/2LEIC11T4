import 'package:freezed_annotation/freezed_annotation.dart';

part 'author.freezed.dart';
part 'author.g.dart';

@freezed
class author with _$author {
  const factory author({required String code, required String name}) = _author;

  factory author.fromJson(Map<String, Object?> json) => _$authorFromJson(json);
}
