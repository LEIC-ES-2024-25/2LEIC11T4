// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contribution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Contribution {

 int get iduser; int get idBook; List<String> get images; Condition get condition;
/// Create a copy of Contribution
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContributionCopyWith<Contribution> get copyWith => _$ContributionCopyWithImpl<Contribution>(this as Contribution, _$identity);

  /// Serializes this Contribution to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Contribution&&(identical(other.iduser, iduser) || other.iduser == iduser)&&(identical(other.idBook, idBook) || other.idBook == idBook)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.condition, condition) || other.condition == condition));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iduser,idBook,const DeepCollectionEquality().hash(images),condition);

@override
String toString() {
  return 'Contribution(iduser: $iduser, idBook: $idBook, images: $images, condition: $condition)';
}


}

/// @nodoc
abstract mixin class $ContributionCopyWith<$Res>  {
  factory $ContributionCopyWith(Contribution value, $Res Function(Contribution) _then) = _$ContributionCopyWithImpl;
@useResult
$Res call({
 int iduser, int idBook, List<String> images, Condition condition
});




}
/// @nodoc
class _$ContributionCopyWithImpl<$Res>
    implements $ContributionCopyWith<$Res> {
  _$ContributionCopyWithImpl(this._self, this._then);

  final Contribution _self;
  final $Res Function(Contribution) _then;

/// Create a copy of Contribution
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iduser = null,Object? idBook = null,Object? images = null,Object? condition = null,}) {
  return _then(_self.copyWith(
iduser: null == iduser ? _self.iduser : iduser // ignore: cast_nullable_to_non_nullable
as int,idBook: null == idBook ? _self.idBook : idBook // ignore: cast_nullable_to_non_nullable
as int,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as Condition,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Contribution implements Contribution {
  const _Contribution({required this.iduser, required this.idBook, required final  List<String> images, required this.condition}): _images = images;
  factory _Contribution.fromJson(Map<String, dynamic> json) => _$ContributionFromJson(json);

@override final  int iduser;
@override final  int idBook;
 final  List<String> _images;
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  Condition condition;

/// Create a copy of Contribution
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContributionCopyWith<_Contribution> get copyWith => __$ContributionCopyWithImpl<_Contribution>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContributionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Contribution&&(identical(other.iduser, iduser) || other.iduser == iduser)&&(identical(other.idBook, idBook) || other.idBook == idBook)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.condition, condition) || other.condition == condition));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iduser,idBook,const DeepCollectionEquality().hash(_images),condition);

@override
String toString() {
  return 'Contribution(iduser: $iduser, idBook: $idBook, images: $images, condition: $condition)';
}


}

/// @nodoc
abstract mixin class _$ContributionCopyWith<$Res> implements $ContributionCopyWith<$Res> {
  factory _$ContributionCopyWith(_Contribution value, $Res Function(_Contribution) _then) = __$ContributionCopyWithImpl;
@override @useResult
$Res call({
 int iduser, int idBook, List<String> images, Condition condition
});




}
/// @nodoc
class __$ContributionCopyWithImpl<$Res>
    implements _$ContributionCopyWith<$Res> {
  __$ContributionCopyWithImpl(this._self, this._then);

  final _Contribution _self;
  final $Res Function(_Contribution) _then;

/// Create a copy of Contribution
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iduser = null,Object? idBook = null,Object? images = null,Object? condition = null,}) {
  return _then(_Contribution(
iduser: null == iduser ? _self.iduser : iduser // ignore: cast_nullable_to_non_nullable
as int,idBook: null == idBook ? _self.idBook : idBook // ignore: cast_nullable_to_non_nullable
as int,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as Condition,
  ));
}


}

// dart format on
