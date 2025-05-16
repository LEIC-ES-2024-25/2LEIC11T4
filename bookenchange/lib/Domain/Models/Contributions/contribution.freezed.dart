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

 String get uid; String get isbn; String get condition;// Changed from String to Condition
 String get degree; String get institution; List<String> get images;
/// Create a copy of Contribution
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContributionCopyWith<Contribution> get copyWith => _$ContributionCopyWithImpl<Contribution>(this as Contribution, _$identity);

  /// Serializes this Contribution to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Contribution&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.institution, institution) || other.institution == institution)&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,isbn,condition,degree,institution,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'Contribution(uid: $uid, isbn: $isbn, condition: $condition, degree: $degree, institution: $institution, images: $images)';
}


}

/// @nodoc
abstract mixin class $ContributionCopyWith<$Res>  {
  factory $ContributionCopyWith(Contribution value, $Res Function(Contribution) _then) = _$ContributionCopyWithImpl;
@useResult
$Res call({
 String uid, String isbn, String condition, String degree, String institution, List<String> images
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
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? isbn = null,Object? condition = null,Object? degree = null,Object? institution = null,Object? images = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,isbn: null == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,degree: null == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String,institution: null == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Contribution implements Contribution {
  const _Contribution({required this.uid, required this.isbn, required this.condition, required this.degree, required this.institution, required final  List<String> images}): _images = images;
  factory _Contribution.fromJson(Map<String, dynamic> json) => _$ContributionFromJson(json);

@override final  String uid;
@override final  String isbn;
@override final  String condition;
// Changed from String to Condition
@override final  String degree;
@override final  String institution;
 final  List<String> _images;
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Contribution&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.institution, institution) || other.institution == institution)&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,isbn,condition,degree,institution,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'Contribution(uid: $uid, isbn: $isbn, condition: $condition, degree: $degree, institution: $institution, images: $images)';
}


}

/// @nodoc
abstract mixin class _$ContributionCopyWith<$Res> implements $ContributionCopyWith<$Res> {
  factory _$ContributionCopyWith(_Contribution value, $Res Function(_Contribution) _then) = __$ContributionCopyWithImpl;
@override @useResult
$Res call({
 String uid, String isbn, String condition, String degree, String institution, List<String> images
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
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? isbn = null,Object? condition = null,Object? degree = null,Object? institution = null,Object? images = null,}) {
  return _then(_Contribution(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,isbn: null == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,degree: null == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String,institution: null == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
