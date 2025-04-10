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

 int get id; String get name; String get institution;
/// Create a copy of users
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$usersCopyWith<users> get copyWith => _$usersCopyWithImpl<users>(this as users, _$identity);

  /// Serializes this users to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is users&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.institution, institution) || other.institution == institution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,institution);

@override
String toString() {
  return 'users(id: $id, name: $name, institution: $institution)';
}


}

/// @nodoc
abstract mixin class $usersCopyWith<$Res>  {
  factory $usersCopyWith(users value, $Res Function(users) _then) = _$usersCopyWithImpl;
@useResult
$Res call({
 int id, String name, String institution
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? institution = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,institution: null == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _users implements users {
  const _users({required this.id, required this.name, required this.institution});
  factory _users.fromJson(Map<String, dynamic> json) => _$usersFromJson(json);

@override final  int id;
@override final  String name;
@override final  String institution;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _users&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.institution, institution) || other.institution == institution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,institution);

@override
String toString() {
  return 'users(id: $id, name: $name, institution: $institution)';
}


}

/// @nodoc
abstract mixin class _$usersCopyWith<$Res> implements $usersCopyWith<$Res> {
  factory _$usersCopyWith(_users value, $Res Function(_users) _then) = __$usersCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String institution
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? institution = null,}) {
  return _then(_users(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,institution: null == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
