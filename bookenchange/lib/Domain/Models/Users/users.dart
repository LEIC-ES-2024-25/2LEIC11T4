import 'package:freezed_annotation/freezed_annotation.dart';

part 'users.freezed.dart';
part 'users.g.dart';

@freezed
class users with _$users {
  const factory users({
    required int id,
    required String First_name,
    required String Last_name,
    required String username,
    required int institutionid,
    required int degreeid,
    required int yearofStudy,
  }) = _users;

  factory users.fromJson(Map<String, Object?> json) => _$usersFromJson(json);

}
