// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Follow {

 int get IdUser1; int get IdUser2;
/// Create a copy of Follow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FollowCopyWith<Follow> get copyWith => _$FollowCopyWithImpl<Follow>(this as Follow, _$identity);

  /// Serializes this Follow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Follow&&(identical(other.IdUser1, IdUser1) || other.IdUser1 == IdUser1)&&(identical(other.IdUser2, IdUser2) || other.IdUser2 == IdUser2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,IdUser1,IdUser2);

@override
String toString() {
  return 'Follow(IdUser1: $IdUser1, IdUser2: $IdUser2)';
}


}

/// @nodoc
abstract mixin class $FollowCopyWith<$Res>  {
  factory $FollowCopyWith(Follow value, $Res Function(Follow) _then) = _$FollowCopyWithImpl;
@useResult
$Res call({
 int IdUser1, int IdUser2
});




}
/// @nodoc
class _$FollowCopyWithImpl<$Res>
    implements $FollowCopyWith<$Res> {
  _$FollowCopyWithImpl(this._self, this._then);

  final Follow _self;
  final $Res Function(Follow) _then;

/// Create a copy of Follow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? IdUser1 = null,Object? IdUser2 = null,}) {
  return _then(_self.copyWith(
IdUser1: null == IdUser1 ? _self.IdUser1 : IdUser1 // ignore: cast_nullable_to_non_nullable
as int,IdUser2: null == IdUser2 ? _self.IdUser2 : IdUser2 // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Follow implements Follow {
  const _Follow({required this.IdUser1, required this.IdUser2});
  factory _Follow.fromJson(Map<String, dynamic> json) => _$FollowFromJson(json);

@override final  int IdUser1;
@override final  int IdUser2;

/// Create a copy of Follow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowCopyWith<_Follow> get copyWith => __$FollowCopyWithImpl<_Follow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FollowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Follow&&(identical(other.IdUser1, IdUser1) || other.IdUser1 == IdUser1)&&(identical(other.IdUser2, IdUser2) || other.IdUser2 == IdUser2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,IdUser1,IdUser2);

@override
String toString() {
  return 'Follow(IdUser1: $IdUser1, IdUser2: $IdUser2)';
}


}

/// @nodoc
abstract mixin class _$FollowCopyWith<$Res> implements $FollowCopyWith<$Res> {
  factory _$FollowCopyWith(_Follow value, $Res Function(_Follow) _then) = __$FollowCopyWithImpl;
@override @useResult
$Res call({
 int IdUser1, int IdUser2
});




}
/// @nodoc
class __$FollowCopyWithImpl<$Res>
    implements _$FollowCopyWith<$Res> {
  __$FollowCopyWithImpl(this._self, this._then);

  final _Follow _self;
  final $Res Function(_Follow) _then;

/// Create a copy of Follow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? IdUser1 = null,Object? IdUser2 = null,}) {
  return _then(_Follow(
IdUser1: null == IdUser1 ? _self.IdUser1 : IdUser1 // ignore: cast_nullable_to_non_nullable
as int,IdUser2: null == IdUser2 ? _self.IdUser2 : IdUser2 // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
