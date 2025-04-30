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
mixin _$Institution {

 String get institution;
/// Create a copy of Institution
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InstitutionCopyWith<Institution> get copyWith => _$InstitutionCopyWithImpl<Institution>(this as Institution, _$identity);

  /// Serializes this Institution to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Institution&&(identical(other.institution, institution) || other.institution == institution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,institution);

@override
String toString() {
  return 'Institution(institution: $institution)';
}


}

/// @nodoc
abstract mixin class $InstitutionCopyWith<$Res>  {
  factory $InstitutionCopyWith(Institution value, $Res Function(Institution) _then) = _$InstitutionCopyWithImpl;
@useResult
$Res call({
 String institution
});




}
/// @nodoc
class _$InstitutionCopyWithImpl<$Res>
    implements $InstitutionCopyWith<$Res> {
  _$InstitutionCopyWithImpl(this._self, this._then);

  final Institution _self;
  final $Res Function(Institution) _then;

/// Create a copy of Institution
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

class _Institution implements Institution {
  const _Institution({required this.institution});
  factory _Institution.fromJson(Map<String, dynamic> json) => _$InstitutionFromJson(json);

@override final  String institution;

/// Create a copy of Institution
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InstitutionCopyWith<_Institution> get copyWith => __$InstitutionCopyWithImpl<_Institution>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InstitutionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Institution&&(identical(other.institution, institution) || other.institution == institution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,institution);

@override
String toString() {
  return 'Institution(institution: $institution)';
}


}

/// @nodoc
abstract mixin class _$InstitutionCopyWith<$Res> implements $InstitutionCopyWith<$Res> {
  factory _$InstitutionCopyWith(_Institution value, $Res Function(_Institution) _then) = __$InstitutionCopyWithImpl;
@override @useResult
$Res call({
 String institution
});




}
/// @nodoc
class __$InstitutionCopyWithImpl<$Res>
    implements _$InstitutionCopyWith<$Res> {
  __$InstitutionCopyWithImpl(this._self, this._then);

  final _Institution _self;
  final $Res Function(_Institution) _then;

/// Create a copy of Institution
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? institution = null,}) {
  return _then(_Institution(
institution: null == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
