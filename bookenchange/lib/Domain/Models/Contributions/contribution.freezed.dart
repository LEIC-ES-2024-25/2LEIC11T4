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

 String? get id; String? get iduser; String? get idbook; String get description; Condition get condition; List<String> get images;@JsonKey(name: 'name') String? get bookName;// 🔥 Map Firestore field "name" to Dart's "bookName"
 String? get username;
/// Create a copy of Contribution
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContributionCopyWith<Contribution> get copyWith => _$ContributionCopyWithImpl<Contribution>(this as Contribution, _$identity);

  /// Serializes this Contribution to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Contribution&&(identical(other.id, id) || other.id == id)&&(identical(other.iduser, iduser) || other.iduser == iduser)&&(identical(other.idbook, idbook) || other.idbook == idbook)&&(identical(other.description, description) || other.description == description)&&(identical(other.condition, condition) || other.condition == condition)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.bookName, bookName) || other.bookName == bookName)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,iduser,idbook,description,condition,const DeepCollectionEquality().hash(images),bookName,username);

@override
String toString() {
  return 'Contribution(id: $id, iduser: $iduser, idbook: $idbook, description: $description, condition: $condition, images: $images, bookName: $bookName, username: $username)';
}


}

/// @nodoc
abstract mixin class $ContributionCopyWith<$Res>  {
  factory $ContributionCopyWith(Contribution value, $Res Function(Contribution) _then) = _$ContributionCopyWithImpl;
@useResult
$Res call({
 String? id, String? iduser, String? idbook, String description, Condition condition, List<String> images,@JsonKey(name: 'name') String? bookName, String? username
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? iduser = freezed,Object? idbook = freezed,Object? description = null,Object? condition = null,Object? images = null,Object? bookName = freezed,Object? username = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,iduser: freezed == iduser ? _self.iduser : iduser // ignore: cast_nullable_to_non_nullable
as String?,idbook: freezed == idbook ? _self.idbook : idbook // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as Condition,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,bookName: freezed == bookName ? _self.bookName : bookName // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Contribution implements Contribution {
  const _Contribution({this.id, this.iduser, this.idbook, required this.description, required this.condition, required final  List<String> images, @JsonKey(name: 'name') this.bookName, this.username}): _images = images;
  factory _Contribution.fromJson(Map<String, dynamic> json) => _$ContributionFromJson(json);

@override final  String? id;
@override final  String? iduser;
@override final  String? idbook;
@override final  String description;
@override final  Condition condition;
 final  List<String> _images;
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override@JsonKey(name: 'name') final  String? bookName;
// 🔥 Map Firestore field "name" to Dart's "bookName"
@override final  String? username;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Contribution&&(identical(other.id, id) || other.id == id)&&(identical(other.iduser, iduser) || other.iduser == iduser)&&(identical(other.idbook, idbook) || other.idbook == idbook)&&(identical(other.description, description) || other.description == description)&&(identical(other.condition, condition) || other.condition == condition)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.bookName, bookName) || other.bookName == bookName)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,iduser,idbook,description,condition,const DeepCollectionEquality().hash(_images),bookName,username);

@override
String toString() {
  return 'Contribution(id: $id, iduser: $iduser, idbook: $idbook, description: $description, condition: $condition, images: $images, bookName: $bookName, username: $username)';
}


}

/// @nodoc
abstract mixin class _$ContributionCopyWith<$Res> implements $ContributionCopyWith<$Res> {
  factory _$ContributionCopyWith(_Contribution value, $Res Function(_Contribution) _then) = __$ContributionCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? iduser, String? idbook, String description, Condition condition, List<String> images,@JsonKey(name: 'name') String? bookName, String? username
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? iduser = freezed,Object? idbook = freezed,Object? description = null,Object? condition = null,Object? images = null,Object? bookName = freezed,Object? username = freezed,}) {
  return _then(_Contribution(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,iduser: freezed == iduser ? _self.iduser : iduser // ignore: cast_nullable_to_non_nullable
as String?,idbook: freezed == idbook ? _self.idbook : idbook // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as Condition,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,bookName: freezed == bookName ? _self.bookName : bookName // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
