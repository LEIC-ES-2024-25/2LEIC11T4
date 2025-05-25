import 'package:freezed_annotation/freezed_annotation.dart';

part 'users.freezed.dart';
part 'users.g.dart';

@freezed
abstract class Users with _$Users {
  const factory Users({
    required String First_name,
    required String Last_name,
    required String username,
    required String email,
    required String institutionid,
    required String degreeid,
    required int yearofStudy,
    final String? profileImageUrl,
  }) = _Users;

  factory Users.fromJson(Map<String, Object?> json) => _$UsersFromJson(json);
}
