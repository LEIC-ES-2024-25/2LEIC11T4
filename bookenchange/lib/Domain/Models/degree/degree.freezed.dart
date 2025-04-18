// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'degree.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$degree {

 String get degree;
/// Create a copy of degree
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$degreeCopyWith<degree> get copyWith => _$degreeCopyWithImpl<degree>(this as degree, _$identity);

  /// Serializes this degree to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is degree&&(identical(other.degree, degree) || other.degree == degree));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,degree);

@override
String toString() {
  return 'degree(degree: $degree)';
}


}

/// @nodoc
abstract mixin class $degreeCopyWith<$Res>  {
  factory $degreeCopyWith(degree value, $Res Function(degree) _then) = _$degreeCopyWithImpl;
@useResult
$Res call({
 String degree
});




}
/// @nodoc
class _$degreeCopyWithImpl<$Res>
    implements $degreeCopyWith<$Res> {
  _$degreeCopyWithImpl(this._self, this._then);

  final degree _self;
  final $Res Function(degree) _then;

/// Create a copy of degree
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? degree = null,}) {
  return _then(_self.copyWith(
degree: null == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _degree implements degree {
  const _degree({required this.degree});
  factory _degree.fromJson(Map<String, dynamic> json) => _$degreeFromJson(json);

@override final  String degree;

/// Create a copy of degree
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$degreeCopyWith<_degree> get copyWith => __$degreeCopyWithImpl<_degree>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$degreeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _degree&&(identical(other.degree, degree) || other.degree == degree));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,degree);

@override
String toString() {
  return 'degree(degree: $degree)';
}


}

/// @nodoc
abstract mixin class _$degreeCopyWith<$Res> implements $degreeCopyWith<$Res> {
  factory _$degreeCopyWith(_degree value, $Res Function(_degree) _then) = __$degreeCopyWithImpl;
@override @useResult
$Res call({
 String degree
});




}
/// @nodoc
class __$degreeCopyWithImpl<$Res>
    implements _$degreeCopyWith<$Res> {
  __$degreeCopyWithImpl(this._self, this._then);

  final _degree _self;
  final $Res Function(_degree) _then;

/// Create a copy of degree
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? degree = null,}) {
  return _then(_degree(
degree: null == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
