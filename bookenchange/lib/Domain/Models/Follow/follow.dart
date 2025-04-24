import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow.freezed.dart';
part 'follow.g.dart';

@freezed
abstract class follow with _$follow {
  const factory follow({required int iduser1, required int iduser2}) = _follow;

  factory follow.fromJson(Map<String, Object?> json) => _$followFromJson(json);
}
