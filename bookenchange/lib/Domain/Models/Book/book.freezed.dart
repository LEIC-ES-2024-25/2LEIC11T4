// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Book {

 String get ISBN; String get name; List<String> get authors; String get Publisher;
/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookCopyWith<Book> get copyWith => _$BookCopyWithImpl<Book>(this as Book, _$identity);

  /// Serializes this Book to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Book&&(identical(other.ISBN, ISBN) || other.ISBN == ISBN)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.authors, authors)&&(identical(other.Publisher, Publisher) || other.Publisher == Publisher));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ISBN,name,const DeepCollectionEquality().hash(authors),Publisher);

@override
String toString() {
  return 'Book(ISBN: $ISBN, name: $name, authors: $authors, Publisher: $Publisher)';
}


}

/// @nodoc
abstract mixin class $BookCopyWith<$Res>  {
  factory $BookCopyWith(Book value, $Res Function(Book) _then) = _$BookCopyWithImpl;
@useResult
$Res call({
 String ISBN, String name, List<String> authors, String Publisher
});




}
/// @nodoc
class _$BookCopyWithImpl<$Res>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._self, this._then);

  final Book _self;
  final $Res Function(Book) _then;

/// Create a copy of Book
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

class _Book implements Book {
  const _Book({required this.ISBN, required this.name, required final  List<String> authors, required this.Publisher}): _authors = authors;
  factory _Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

@override final  String ISBN;
@override final  String name;
 final  List<String> _authors;
@override List<String> get authors {
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authors);
}

@override final  String Publisher;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookCopyWith<_Book> get copyWith => __$BookCopyWithImpl<_Book>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Book&&(identical(other.ISBN, ISBN) || other.ISBN == ISBN)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._authors, _authors)&&(identical(other.Publisher, Publisher) || other.Publisher == Publisher));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ISBN,name,const DeepCollectionEquality().hash(_authors),Publisher);

@override
String toString() {
  return 'Book(ISBN: $ISBN, name: $name, authors: $authors, Publisher: $Publisher)';
}


}

/// @nodoc
abstract mixin class _$BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$BookCopyWith(_Book value, $Res Function(_Book) _then) = __$BookCopyWithImpl;
@override @useResult
$Res call({
 String ISBN, String name, List<String> authors, String Publisher
});




}
/// @nodoc
class __$BookCopyWithImpl<$Res>
    implements _$BookCopyWith<$Res> {
  __$BookCopyWithImpl(this._self, this._then);

  final _Book _self;
  final $Res Function(_Book) _then;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ISBN = null,Object? name = null,Object? authors = null,Object? Publisher = null,}) {
  return _then(_Book(
ISBN: null == ISBN ? _self.ISBN : ISBN // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,authors: null == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,Publisher: null == Publisher ? _self.Publisher : Publisher // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
