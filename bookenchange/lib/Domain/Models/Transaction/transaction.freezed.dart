// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$transactions {
  int get idcontribution;
  int get iduser1;
  int get iduser2;
  DateTime get date;

  /// Create a copy of transactions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $transactionsCopyWith<transactions> get copyWith =>
      _$transactionsCopyWithImpl<transactions>(
          this as transactions, _$identity);

  /// Serializes this transactions to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is transactions &&
            (identical(other.idcontribution, idcontribution) ||
                other.idcontribution == idcontribution) &&
            (identical(other.iduser1, iduser1) || other.iduser1 == iduser1) &&
            (identical(other.iduser2, iduser2) || other.iduser2 == iduser2) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idcontribution, iduser1, iduser2, date);

  @override
  String toString() {
    return 'transactions(idcontribution: $idcontribution, iduser1: $iduser1, iduser2: $iduser2, date: $date)';
  }
}

/// @nodoc
abstract mixin class $transactionsCopyWith<$Res> {
  factory $transactionsCopyWith(
          transactions value, $Res Function(transactions) _then) =
      _$transactionsCopyWithImpl;
  @useResult
  $Res call({int idcontribution, int iduser1, int iduser2, DateTime date});
}

/// @nodoc
class _$transactionsCopyWithImpl<$Res> implements $transactionsCopyWith<$Res> {
  _$transactionsCopyWithImpl(this._self, this._then);

  final transactions _self;
  final $Res Function(transactions) _then;

  /// Create a copy of transactions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idcontribution = null,
    Object? iduser1 = null,
    Object? iduser2 = null,
    Object? date = null,
  }) {
    return _then(_self.copyWith(
      idcontribution: null == idcontribution
          ? _self.idcontribution
          : idcontribution // ignore: cast_nullable_to_non_nullable
              as int,
      iduser1: null == iduser1
          ? _self.iduser1
          : iduser1 // ignore: cast_nullable_to_non_nullable
              as int,
      iduser2: null == iduser2
          ? _self.iduser2
          : iduser2 // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _transactions implements transactions {
  const _transactions(
      {required this.idcontribution,
      required this.iduser1,
      required this.iduser2,
      required this.date});
  factory _transactions.fromJson(Map<String, dynamic> json) =>
      _$transactionsFromJson(json);

  @override
  final int idcontribution;
  @override
  final int iduser1;
  @override
  final int iduser2;
  @override
  final DateTime date;

  /// Create a copy of transactions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$transactionsCopyWith<_transactions> get copyWith =>
      __$transactionsCopyWithImpl<_transactions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$transactionsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _transactions &&
            (identical(other.idcontribution, idcontribution) ||
                other.idcontribution == idcontribution) &&
            (identical(other.iduser1, iduser1) || other.iduser1 == iduser1) &&
            (identical(other.iduser2, iduser2) || other.iduser2 == iduser2) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idcontribution, iduser1, iduser2, date);

  @override
  String toString() {
    return 'transactions(idcontribution: $idcontribution, iduser1: $iduser1, iduser2: $iduser2, date: $date)';
  }
}

/// @nodoc
abstract mixin class _$transactionsCopyWith<$Res>
    implements $transactionsCopyWith<$Res> {
  factory _$transactionsCopyWith(
          _transactions value, $Res Function(_transactions) _then) =
      __$transactionsCopyWithImpl;
  @override
  @useResult
  $Res call({int idcontribution, int iduser1, int iduser2, DateTime date});
}

/// @nodoc
class __$transactionsCopyWithImpl<$Res>
    implements _$transactionsCopyWith<$Res> {
  __$transactionsCopyWithImpl(this._self, this._then);

  final _transactions _self;
  final $Res Function(_transactions) _then;

  /// Create a copy of transactions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? idcontribution = null,
    Object? iduser1 = null,
    Object? iduser2 = null,
    Object? date = null,
  }) {
    return _then(_transactions(
      idcontribution: null == idcontribution
          ? _self.idcontribution
          : idcontribution // ignore: cast_nullable_to_non_nullable
              as int,
      iduser1: null == iduser1
          ? _self.iduser1
          : iduser1 // ignore: cast_nullable_to_non_nullable
              as int,
      iduser2: null == iduser2
          ? _self.iduser2
          : iduser2 // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
