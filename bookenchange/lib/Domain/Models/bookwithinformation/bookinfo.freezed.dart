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
mixin _$bookinfo {

 String get ISBN; String get name; List<String> get authors; String get Publisher;
/// Create a copy of bookinfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$bookinfoCopyWith<bookinfo> get copyWith => _$bookinfoCopyWithImpl<bookinfo>(this as bookinfo, _$identity);

  /// Serializes this bookinfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is bookinfo&&(identical(other.ISBN, ISBN) || other.ISBN == ISBN)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.authors, authors)&&(identical(other.Publisher, Publisher) || other.Publisher == Publisher));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ISBN,name,const DeepCollectionEquality().hash(authors),Publisher);

@override
String toString() {
  return 'bookinfo(ISBN: $ISBN, name: $name, authors: $authors, Publisher: $Publisher)';
}


}

/// @nodoc
abstract mixin class $bookinfoCopyWith<$Res>  {
  factory $bookinfoCopyWith(bookinfo value, $Res Function(bookinfo) _then) = _$bookinfoCopyWithImpl;
@useResult
$Res call({
 String ISBN, String name, List<String> authors, String Publisher
});




}
/// @nodoc
class _$bookinfoCopyWithImpl<$Res>
    implements $bookinfoCopyWith<$Res> {
  _$bookinfoCopyWithImpl(this._self, this._then);

  final bookinfo _self;
  final $Res Function(bookinfo) _then;

/// Create a copy of bookinfo
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

class _bookinfo implements bookinfo {
  const _bookinfo({required this.ISBN, required this.name, required final  List<String> authors, required this.Publisher}): _authors = authors;
  factory _bookinfo.fromJson(Map<String, dynamic> json) => _$bookinfoFromJson(json);

@override final  String ISBN;
@override final  String name;
 final  List<String> _authors;
@override List<String> get authors {
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authors);
}

@override final  String Publisher;

/// Create a copy of bookinfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$bookinfoCopyWith<_bookinfo> get copyWith => __$bookinfoCopyWithImpl<_bookinfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$bookinfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _bookinfo&&(identical(other.ISBN, ISBN) || other.ISBN == ISBN)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._authors, _authors)&&(identical(other.Publisher, Publisher) || other.Publisher == Publisher));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ISBN,name,const DeepCollectionEquality().hash(_authors),Publisher);

@override
String toString() {
  return 'bookinfo(ISBN: $ISBN, name: $name, authors: $authors, Publisher: $Publisher)';
}


}

/// @nodoc
abstract mixin class _$bookinfoCopyWith<$Res> implements $bookinfoCopyWith<$Res> {
  factory _$bookinfoCopyWith(_bookinfo value, $Res Function(_bookinfo) _then) = __$bookinfoCopyWithImpl;
@override @useResult
$Res call({
 String ISBN, String name, List<String> authors, String Publisher
});




}
/// @nodoc
class __$bookinfoCopyWithImpl<$Res>
    implements _$bookinfoCopyWith<$Res> {
  __$bookinfoCopyWithImpl(this._self, this._then);

  final _bookinfo _self;
  final $Res Function(_bookinfo) _then;

/// Create a copy of bookinfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ISBN = null,Object? name = null,Object? authors = null,Object? Publisher = null,}) {
  return _then(_bookinfo(
ISBN: null == ISBN ? _self.ISBN : ISBN // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,authors: null == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,Publisher: null == Publisher ? _self.Publisher : Publisher // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
