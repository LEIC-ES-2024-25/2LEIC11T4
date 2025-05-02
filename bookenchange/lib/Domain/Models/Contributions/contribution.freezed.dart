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

 int get iduser; int get idBook; String get description; Condition get condition;// Changed from String to Condition
 String get area; String get university; List<String> get images;
/// Create a copy of Contribution
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContributionCopyWith<Contribution> get copyWith => _$ContributionCopyWithImpl<Contribution>(this as Contribution, _$identity);

  /// Serializes this Contribution to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Contribution&&(identical(other.iduser, iduser) || other.iduser == iduser)&&(identical(other.idBook, idBook) || other.idBook == idBook)&&(identical(other.description, description) || other.description == description)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.area, area) || other.area == area)&&(identical(other.university, university) || other.university == university)&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iduser,idBook,description,condition,area,university,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'Contribution(iduser: $iduser, idBook: $idBook, description: $description, condition: $condition, area: $area, university: $university, images: $images)';
}


}

/// @nodoc
abstract mixin class $ContributionCopyWith<$Res>  {
  factory $ContributionCopyWith(Contribution value, $Res Function(Contribution) _then) = _$ContributionCopyWithImpl;
@useResult
$Res call({
 int iduser, int idBook, String description, Condition condition, String area, String university, List<String> images
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
@pragma('vm:prefer-inline') @override $Res call({Object? iduser = null,Object? idBook = null,Object? description = null,Object? condition = null,Object? area = null,Object? university = null,Object? images = null,}) {
  return _then(_self.copyWith(
iduser: null == iduser ? _self.iduser : iduser // ignore: cast_nullable_to_non_nullable
as int,idBook: null == idBook ? _self.idBook : idBook // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as Condition,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,university: null == university ? _self.university : university // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Contribution implements Contribution {
  const _Contribution({required this.iduser, required this.idBook, required this.description, required this.condition, required this.area, required this.university, required final  List<String> images}): _images = images;
  factory _Contribution.fromJson(Map<String, dynamic> json) => _$ContributionFromJson(json);

@override final  int iduser;
@override final  int idBook;
@override final  String description;
@override final  Condition condition;
// Changed from String to Condition
@override final  String area;
@override final  String university;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Contribution&&(identical(other.iduser, iduser) || other.iduser == iduser)&&(identical(other.idBook, idBook) || other.idBook == idBook)&&(identical(other.description, description) || other.description == description)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.area, area) || other.area == area)&&(identical(other.university, university) || other.university == university)&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iduser,idBook,description,condition,area,university,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'Contribution(iduser: $iduser, idBook: $idBook, description: $description, condition: $condition, area: $area, university: $university, images: $images)';
}


}

/// @nodoc
abstract mixin class _$ContributionCopyWith<$Res> implements $ContributionCopyWith<$Res> {
  factory _$ContributionCopyWith(_Contribution value, $Res Function(_Contribution) _then) = __$ContributionCopyWithImpl;
@override @useResult
$Res call({
 int iduser, int idBook, String description, Condition condition, String area, String university, List<String> images
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
@override @pragma('vm:prefer-inline') $Res call({Object? iduser = null,Object? idBook = null,Object? description = null,Object? condition = null,Object? area = null,Object? university = null,Object? images = null,}) {
  return _then(_Contribution(
iduser: null == iduser ? _self.iduser : iduser // ignore: cast_nullable_to_non_nullable
as int,idBook: null == idBook ? _self.idBook : idBook // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as Condition,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,university: null == university ? _self.university : university // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
