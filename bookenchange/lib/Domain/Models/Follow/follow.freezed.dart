// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$follow {
  int get iduser1;
  int get iduser2;

  /// Create a copy of follow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $followCopyWith<follow> get copyWith =>
      _$followCopyWithImpl<follow>(this as follow, _$identity);

  /// Serializes this follow to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is follow &&
            (identical(other.iduser1, iduser1) || other.iduser1 == iduser1) &&
            (identical(other.iduser2, iduser2) || other.iduser2 == iduser2));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, iduser1, iduser2);

  @override
  String toString() {
    return 'follow(iduser1: $iduser1, iduser2: $iduser2)';
  }
}

/// @nodoc
abstract mixin class $followCopyWith<$Res> {
  factory $followCopyWith(follow value, $Res Function(follow) _then) =
      _$followCopyWithImpl;
  @useResult
  $Res call({int iduser1, int iduser2});
}

/// @nodoc
class _$followCopyWithImpl<$Res> implements $followCopyWith<$Res> {
  _$followCopyWithImpl(this._self, this._then);

  final follow _self;
  final $Res Function(follow) _then;

  /// Create a copy of follow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iduser1 = null,
    Object? iduser2 = null,
  }) {
    return _then(_self.copyWith(
      iduser1: null == iduser1
          ? _self.iduser1
          : iduser1 // ignore: cast_nullable_to_non_nullable
              as int,
      iduser2: null == iduser2
          ? _self.iduser2
          : iduser2 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _follow implements follow {
  const _follow({required this.iduser1, required this.iduser2});
  factory _follow.fromJson(Map<String, dynamic> json) => _$followFromJson(json);

  @override
  final int iduser1;
  @override
  final int iduser2;

  /// Create a copy of follow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$followCopyWith<_follow> get copyWith =>
      __$followCopyWithImpl<_follow>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$followToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _follow &&
            (identical(other.iduser1, iduser1) || other.iduser1 == iduser1) &&
            (identical(other.iduser2, iduser2) || other.iduser2 == iduser2));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, iduser1, iduser2);

  @override
  String toString() {
    return 'follow(iduser1: $iduser1, iduser2: $iduser2)';
  }
}

/// @nodoc
abstract mixin class _$followCopyWith<$Res> implements $followCopyWith<$Res> {
  factory _$followCopyWith(_follow value, $Res Function(_follow) _then) =
      __$followCopyWithImpl;
  @override
  @useResult
  $Res call({int iduser1, int iduser2});
}

/// @nodoc
class __$followCopyWithImpl<$Res> implements _$followCopyWith<$Res> {
  __$followCopyWithImpl(this._self, this._then);

  final _follow _self;
  final $Res Function(_follow) _then;

  /// Create a copy of follow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? iduser1 = null,
    Object? iduser2 = null,
  }) {
    return _then(_follow(
      iduser1: null == iduser1
          ? _self.iduser1
          : iduser1 // ignore: cast_nullable_to_non_nullable
              as int,
      iduser2: null == iduser2
          ? _self.iduser2
          : iduser2 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
