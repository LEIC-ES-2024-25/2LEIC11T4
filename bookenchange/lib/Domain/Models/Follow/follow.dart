import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow.freezed.dart';
part 'follow.g.dart';

@freezed
abstract class Follow with _$Follow {
  const factory Follow({required int IdUser1, required int IdUser2}) = _Follow;

  factory Follow.fromJson(Map<String, Object?> json) => _$FollowFromJson(json);
}