// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookinfo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Bookinfo {

 String get ISBN; String get name; List<String> get authors; String get Publisher;
/// Create a copy of Bookinfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookinfoCopyWith<Bookinfo> get copyWith => _$BookinfoCopyWithImpl<Bookinfo>(this as Bookinfo, _$identity);

  /// Serializes this Bookinfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bookinfo&&(identical(other.ISBN, ISBN) || other.ISBN == ISBN)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.authors, authors)&&(identical(other.Publisher, Publisher) || other.Publisher == Publisher));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ISBN,name,const DeepCollectionEquality().hash(authors),Publisher);

@override
String toString() {
  return 'Bookinfo(ISBN: $ISBN, name: $name, authors: $authors, Publisher: $Publisher)';
}


}

/// @nodoc
abstract mixin class $BookinfoCopyWith<$Res>  {
  factory $BookinfoCopyWith(Bookinfo value, $Res Function(Bookinfo) _then) = _$BookinfoCopyWithImpl;
@useResult
$Res call({
 String ISBN, String name, List<String> authors, String Publisher
});




}
/// @nodoc
class _$BookinfoCopyWithImpl<$Res>
    implements $BookinfoCopyWith<$Res> {
  _$BookinfoCopyWithImpl(this._self, this._then);

  final Bookinfo _self;
  final $Res Function(Bookinfo) _then;

/// Create a copy of Bookinfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ISBN = null,Object? name = null,Object? authors = null,Object? Publisher = null,}) {
  return _then(_self.copyWith(
ISBN: null == ISBN ? _self.ISBN : ISBN // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,authors: null == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,Publisher: null == Publisher ? _self.Publisher : Publisher // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Bookinfo implements Bookinfo {
  const _Bookinfo({required this.ISBN, required this.name, required final  List<String> authors, required this.Publisher}): _authors = authors;
  factory _Bookinfo.fromJson(Map<String, dynamic> json) => _$BookinfoFromJson(json);

@override final  String ISBN;
@override final  String name;
 final  List<String> _authors;
@override List<String> get authors {
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authors);
}

@override final  String Publisher;

/// Create a copy of Bookinfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookinfoCopyWith<_Bookinfo> get copyWith => __$BookinfoCopyWithImpl<_Bookinfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookinfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bookinfo&&(identical(other.ISBN, ISBN) || other.ISBN == ISBN)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._authors, _authors)&&(identical(other.Publisher, Publisher) || other.Publisher == Publisher));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ISBN,name,const DeepCollectionEquality().hash(_authors),Publisher);

@override
String toString() {
  return 'Bookinfo(ISBN: $ISBN, name: $name, authors: $authors, Publisher: $Publisher)';
}


}

/// @nodoc
abstract mixin class _$BookinfoCopyWith<$Res> implements $BookinfoCopyWith<$Res> {
  factory _$BookinfoCopyWith(_Bookinfo value, $Res Function(_Bookinfo) _then) = __$BookinfoCopyWithImpl;
@override @useResult
$Res call({
 String ISBN, String name, List<String> authors, String Publisher
});




}
/// @nodoc
class __$BookinfoCopyWithImpl<$Res>
    implements _$BookinfoCopyWith<$Res> {
  __$BookinfoCopyWithImpl(this._self, this._then);

  final _Bookinfo _self;
  final $Res Function(_Bookinfo) _then;

/// Create a copy of Bookinfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ISBN = null,Object? name = null,Object? authors = null,Object? Publisher = null,}) {
  return _then(_Bookinfo(
ISBN: null == ISBN ? _self.ISBN : ISBN // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,authors: null == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,Publisher: null == Publisher ? _self.Publisher : Publisher // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
