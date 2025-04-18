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
mixin _$users {

 int get id; String get First_name; String get Last_name; String get username; int get institutionid; int get degreeid; int get yearofStudy;
/// Create a copy of users
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$usersCopyWith<users> get copyWith => _$usersCopyWithImpl<users>(this as users, _$identity);

  /// Serializes this users to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is users&&(identical(other.id, id) || other.id == id)&&(identical(other.First_name, First_name) || other.First_name == First_name)&&(identical(other.Last_name, Last_name) || other.Last_name == Last_name)&&(identical(other.username, username) || other.username == username)&&(identical(other.institutionid, institutionid) || other.institutionid == institutionid)&&(identical(other.degreeid, degreeid) || other.degreeid == degreeid)&&(identical(other.yearofStudy, yearofStudy) || other.yearofStudy == yearofStudy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,First_name,Last_name,username,institutionid,degreeid,yearofStudy);

@override
String toString() {
  return 'users(id: $id, First_name: $First_name, Last_name: $Last_name, username: $username, institutionid: $institutionid, degreeid: $degreeid, yearofStudy: $yearofStudy)';
}


}

/// @nodoc
abstract mixin class $usersCopyWith<$Res>  {
  factory $usersCopyWith(users value, $Res Function(users) _then) = _$usersCopyWithImpl;
@useResult
$Res call({
 int id, String First_name, String Last_name, String username, int institutionid, int degreeid, int yearofStudy
});




}
/// @nodoc
class _$usersCopyWithImpl<$Res>
    implements $usersCopyWith<$Res> {
  _$usersCopyWithImpl(this._self, this._then);

  final users _self;
  final $Res Function(users) _then;

/// Create a copy of users
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? First_name = null,Object? Last_name = null,Object? username = null,Object? institutionid = null,Object? degreeid = null,Object? yearofStudy = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,First_name: null == First_name ? _self.First_name : First_name // ignore: cast_nullable_to_non_nullable
as String,Last_name: null == Last_name ? _self.Last_name : Last_name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,institutionid: null == institutionid ? _self.institutionid : institutionid // ignore: cast_nullable_to_non_nullable
as int,degreeid: null == degreeid ? _self.degreeid : degreeid // ignore: cast_nullable_to_non_nullable
as int,yearofStudy: null == yearofStudy ? _self.yearofStudy : yearofStudy // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _users implements users {
  const _users({required this.id, required this.First_name, required this.Last_name, required this.username, required this.institutionid, required this.degreeid, required this.yearofStudy});
  factory _users.fromJson(Map<String, dynamic> json) => _$usersFromJson(json);

@override final  int id;
@override final  String First_name;
@override final  String Last_name;
@override final  String username;
@override final  int institutionid;
@override final  int degreeid;
@override final  int yearofStudy;

/// Create a copy of users
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$usersCopyWith<_users> get copyWith => __$usersCopyWithImpl<_users>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$usersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _users&&(identical(other.id, id) || other.id == id)&&(identical(other.First_name, First_name) || other.First_name == First_name)&&(identical(other.Last_name, Last_name) || other.Last_name == Last_name)&&(identical(other.username, username) || other.username == username)&&(identical(other.institutionid, institutionid) || other.institutionid == institutionid)&&(identical(other.degreeid, degreeid) || other.degreeid == degreeid)&&(identical(other.yearofStudy, yearofStudy) || other.yearofStudy == yearofStudy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,First_name,Last_name,username,institutionid,degreeid,yearofStudy);

@override
String toString() {
  return 'users(id: $id, First_name: $First_name, Last_name: $Last_name, username: $username, institutionid: $institutionid, degreeid: $degreeid, yearofStudy: $yearofStudy)';
}


}

/// @nodoc
abstract mixin class _$usersCopyWith<$Res> implements $usersCopyWith<$Res> {
  factory _$usersCopyWith(_users value, $Res Function(_users) _then) = __$usersCopyWithImpl;
@override @useResult
$Res call({
 int id, String First_name, String Last_name, String username, int institutionid, int degreeid, int yearofStudy
});




}
/// @nodoc
class __$usersCopyWithImpl<$Res>
    implements _$usersCopyWith<$Res> {
  __$usersCopyWithImpl(this._self, this._then);

  final _users _self;
  final $Res Function(_users) _then;

/// Create a copy of users
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? First_name = null,Object? Last_name = null,Object? username = null,Object? institutionid = null,Object? degreeid = null,Object? yearofStudy = null,}) {
  return _then(_users(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,First_name: null == First_name ? _self.First_name : First_name // ignore: cast_nullable_to_non_nullable
as String,Last_name: null == Last_name ? _self.Last_name : Last_name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,institutionid: null == institutionid ? _self.institutionid : institutionid // ignore: cast_nullable_to_non_nullable
as int,degreeid: null == degreeid ? _self.degreeid : degreeid // ignore: cast_nullable_to_non_nullable
as int,yearofStudy: null == yearofStudy ? _self.yearofStudy : yearofStudy // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
