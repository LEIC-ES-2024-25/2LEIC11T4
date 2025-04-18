// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$author {

 String get code; String get name;
/// Create a copy of author
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$authorCopyWith<author> get copyWith => _$authorCopyWithImpl<author>(this as author, _$identity);

  /// Serializes this author to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is author&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name);

@override
String toString() {
  return 'author(code: $code, name: $name)';
}


}

/// @nodoc
abstract mixin class $authorCopyWith<$Res>  {
  factory $authorCopyWith(author value, $Res Function(author) _then) = _$authorCopyWithImpl;
@useResult
$Res call({
 String code, String name
});




}
/// @nodoc
class _$authorCopyWithImpl<$Res>
    implements $authorCopyWith<$Res> {
  _$authorCopyWithImpl(this._self, this._then);

  final author _self;
  final $Res Function(author) _then;

/// Create a copy of author
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _author implements author {
  const _author({required this.code, required this.name});
  factory _author.fromJson(Map<String, dynamic> json) => _$authorFromJson(json);

@override final  String code;
@override final  String name;

/// Create a copy of author
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$authorCopyWith<_author> get copyWith => __$authorCopyWithImpl<_author>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$authorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _author&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name);

@override
String toString() {
  return 'author(code: $code, name: $name)';
}


}

/// @nodoc
abstract mixin class _$authorCopyWith<$Res> implements $authorCopyWith<$Res> {
  factory _$authorCopyWith(_author value, $Res Function(_author) _then) = __$authorCopyWithImpl;
@override @useResult
$Res call({
 String code, String name
});




}
/// @nodoc
class __$authorCopyWithImpl<$Res>
    implements _$authorCopyWith<$Res> {
  __$authorCopyWithImpl(this._self, this._then);

  final _author _self;
  final $Res Function(_author) _then;

/// Create a copy of author
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,}) {
  return _then(_author(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
