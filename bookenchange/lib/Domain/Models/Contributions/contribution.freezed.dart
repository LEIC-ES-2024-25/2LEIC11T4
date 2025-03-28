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
  int get id;
  List<String> get images;
  String get name;
  Condition get condition;
  String get institution;

  /// Create a copy of Contribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContributionCopyWith<Contribution> get copyWith =>
      _$ContributionCopyWithImpl<Contribution>(
          this as Contribution, _$identity);

  /// Serializes this Contribution to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Contribution &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.institution, institution) ||
                other.institution == institution));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(images),
      name,
      condition,
      institution);

  @override
  String toString() {
    return 'Contribution(id: $id, images: $images, name: $name, condition: $condition, institution: $institution)';
  }
}

/// @nodoc
abstract mixin class $ContributionCopyWith<$Res> {
  factory $ContributionCopyWith(
          Contribution value, $Res Function(Contribution) _then) =
      _$ContributionCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      List<String> images,
      String name,
      Condition condition,
      String institution});
}

/// @nodoc
class _$ContributionCopyWithImpl<$Res> implements $ContributionCopyWith<$Res> {
  _$ContributionCopyWithImpl(this._self, this._then);

  final Contribution _self;
  final $Res Function(Contribution) _then;

  /// Create a copy of Contribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? images = null,
    Object? name = null,
    Object? condition = null,
    Object? institution = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      condition: null == condition
          ? _self.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as Condition,
      institution: null == institution
          ? _self.institution
          : institution // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Contribution implements Contribution {
  const _Contribution(
      {required this.id,
      required final List<String> images,
      required this.name,
      required this.condition,
      required this.institution})
      : _images = images;
  factory _Contribution.fromJson(Map<String, dynamic> json) =>
      _$ContributionFromJson(json);

  @override
  final int id;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String name;
  @override
  final Condition condition;
  @override
  final String institution;

  /// Create a copy of Contribution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContributionCopyWith<_Contribution> get copyWith =>
      __$ContributionCopyWithImpl<_Contribution>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContributionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Contribution &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.institution, institution) ||
                other.institution == institution));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_images),
      name,
      condition,
      institution);

  @override
  String toString() {
    return 'Contribution(id: $id, images: $images, name: $name, condition: $condition, institution: $institution)';
  }
}

/// @nodoc
abstract mixin class _$ContributionCopyWith<$Res>
    implements $ContributionCopyWith<$Res> {
  factory _$ContributionCopyWith(
          _Contribution value, $Res Function(_Contribution) _then) =
      __$ContributionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      List<String> images,
      String name,
      Condition condition,
      String institution});
}

/// @nodoc
class __$ContributionCopyWithImpl<$Res>
    implements _$ContributionCopyWith<$Res> {
  __$ContributionCopyWithImpl(this._self, this._then);

  final _Contribution _self;
  final $Res Function(_Contribution) _then;

  /// Create a copy of Contribution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? images = null,
    Object? name = null,
    Object? condition = null,
    Object? institution = null,
  }) {
    return _then(_Contribution(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      condition: null == condition
          ? _self.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as Condition,
      institution: null == institution
          ? _self.institution
          : institution // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
