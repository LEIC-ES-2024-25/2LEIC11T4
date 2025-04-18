// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'institution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$institution {

 String get institution;
/// Create a copy of institution
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$institutionCopyWith<institution> get copyWith => _$institutionCopyWithImpl<institution>(this as institution, _$identity);

  /// Serializes this institution to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is institution&&(identical(other.institution, institution) || other.institution == institution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,institution);

@override
String toString() {
  return 'institution(institution: $institution)';
}


}

/// @nodoc
abstract mixin class $institutionCopyWith<$Res>  {
  factory $institutionCopyWith(institution value, $Res Function(institution) _then) = _$institutionCopyWithImpl;
@useResult
$Res call({
 String institution
});




}
/// @nodoc
class _$institutionCopyWithImpl<$Res>
    implements $institutionCopyWith<$Res> {
  _$institutionCopyWithImpl(this._self, this._then);

  final institution _self;
  final $Res Function(institution) _then;

/// Create a copy of institution
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? institution = null,}) {
  return _then(_self.copyWith(
institution: null == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _institution implements institution {
  const _institution({required this.institution});
  factory _institution.fromJson(Map<String, dynamic> json) => _$institutionFromJson(json);

@override final  String institution;

/// Create a copy of institution
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$institutionCopyWith<_institution> get copyWith => __$institutionCopyWithImpl<_institution>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$institutionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _institution&&(identical(other.institution, institution) || other.institution == institution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,institution);

@override
String toString() {
  return 'institution(institution: $institution)';
}


}

/// @nodoc
abstract mixin class _$institutionCopyWith<$Res> implements $institutionCopyWith<$Res> {
  factory _$institutionCopyWith(_institution value, $Res Function(_institution) _then) = __$institutionCopyWithImpl;
@override @useResult
$Res call({
 String institution
});




}
/// @nodoc
class __$institutionCopyWithImpl<$Res>
    implements _$institutionCopyWith<$Res> {
  __$institutionCopyWithImpl(this._self, this._then);

  final _institution _self;
  final $Res Function(_institution) _then;

/// Create a copy of institution
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? institution = null,}) {
  return _then(_institution(
institution: null == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
