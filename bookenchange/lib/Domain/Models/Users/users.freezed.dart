// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Users {

 String get First_name; String get Last_name; String get username; String get email; String get institutionid; String get degreeid; int get yearofStudy; String? get profileImageUrl;
/// Create a copy of Users
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersCopyWith<Users> get copyWith => _$UsersCopyWithImpl<Users>(this as Users, _$identity);

  /// Serializes this Users to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Users&&(identical(other.First_name, First_name) || other.First_name == First_name)&&(identical(other.Last_name, Last_name) || other.Last_name == Last_name)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.institutionid, institutionid) || other.institutionid == institutionid)&&(identical(other.degreeid, degreeid) || other.degreeid == degreeid)&&(identical(other.yearofStudy, yearofStudy) || other.yearofStudy == yearofStudy)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,First_name,Last_name,username,email,institutionid,degreeid,yearofStudy,profileImageUrl);

@override
String toString() {
  return 'Users(First_name: $First_name, Last_name: $Last_name, username: $username, email: $email, institutionid: $institutionid, degreeid: $degreeid, yearofStudy: $yearofStudy, profileImageUrl: $profileImageUrl)';
}


}

/// @nodoc
abstract mixin class $UsersCopyWith<$Res>  {
  factory $UsersCopyWith(Users value, $Res Function(Users) _then) = _$UsersCopyWithImpl;
@useResult
$Res call({
 String First_name, String Last_name, String username, String email, String institutionid, String degreeid, int yearofStudy, String? profileImageUrl
});




}
/// @nodoc
class _$UsersCopyWithImpl<$Res>
    implements $UsersCopyWith<$Res> {
  _$UsersCopyWithImpl(this._self, this._then);

  final Users _self;
  final $Res Function(Users) _then;

/// Create a copy of Users
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? First_name = null,Object? Last_name = null,Object? username = null,Object? email = null,Object? institutionid = null,Object? degreeid = null,Object? yearofStudy = null,Object? profileImageUrl = freezed,}) {
  return _then(_self.copyWith(
First_name: null == First_name ? _self.First_name : First_name // ignore: cast_nullable_to_non_nullable
as String,Last_name: null == Last_name ? _self.Last_name : Last_name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,institutionid: null == institutionid ? _self.institutionid : institutionid // ignore: cast_nullable_to_non_nullable
as String,degreeid: null == degreeid ? _self.degreeid : degreeid // ignore: cast_nullable_to_non_nullable
as String,yearofStudy: null == yearofStudy ? _self.yearofStudy : yearofStudy // ignore: cast_nullable_to_non_nullable
as int,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Users implements Users {
  const _Users({required this.First_name, required this.Last_name, required this.username, required this.email, required this.institutionid, required this.degreeid, required this.yearofStudy, this.profileImageUrl});
  factory _Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

@override final  String First_name;
@override final  String Last_name;
@override final  String username;
@override final  String email;
@override final  String institutionid;
@override final  String degreeid;
@override final  int yearofStudy;
@override final  String? profileImageUrl;

/// Create a copy of Users
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsersCopyWith<_Users> get copyWith => __$UsersCopyWithImpl<_Users>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Users&&(identical(other.First_name, First_name) || other.First_name == First_name)&&(identical(other.Last_name, Last_name) || other.Last_name == Last_name)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.institutionid, institutionid) || other.institutionid == institutionid)&&(identical(other.degreeid, degreeid) || other.degreeid == degreeid)&&(identical(other.yearofStudy, yearofStudy) || other.yearofStudy == yearofStudy)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,First_name,Last_name,username,email,institutionid,degreeid,yearofStudy,profileImageUrl);

@override
String toString() {
  return 'Users(First_name: $First_name, Last_name: $Last_name, username: $username, email: $email, institutionid: $institutionid, degreeid: $degreeid, yearofStudy: $yearofStudy, profileImageUrl: $profileImageUrl)';
}


}

/// @nodoc
abstract mixin class _$UsersCopyWith<$Res> implements $UsersCopyWith<$Res> {
  factory _$UsersCopyWith(_Users value, $Res Function(_Users) _then) = __$UsersCopyWithImpl;
@override @useResult
$Res call({
 String First_name, String Last_name, String username, String email, String institutionid, String degreeid, int yearofStudy, String? profileImageUrl
});




}
/// @nodoc
class __$UsersCopyWithImpl<$Res>
    implements _$UsersCopyWith<$Res> {
  __$UsersCopyWithImpl(this._self, this._then);

  final _Users _self;
  final $Res Function(_Users) _then;

/// Create a copy of Users
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? First_name = null,Object? Last_name = null,Object? username = null,Object? email = null,Object? institutionid = null,Object? degreeid = null,Object? yearofStudy = null,Object? profileImageUrl = freezed,}) {
  return _then(_Users(
First_name: null == First_name ? _self.First_name : First_name // ignore: cast_nullable_to_non_nullable
as String,Last_name: null == Last_name ? _self.Last_name : Last_name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,institutionid: null == institutionid ? _self.institutionid : institutionid // ignore: cast_nullable_to_non_nullable
as String,degreeid: null == degreeid ? _self.degreeid : degreeid // ignore: cast_nullable_to_non_nullable
as String,yearofStudy: null == yearofStudy ? _self.yearofStudy : yearofStudy // ignore: cast_nullable_to_non_nullable
as int,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
