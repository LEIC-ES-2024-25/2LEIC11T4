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
mixin _$Transactions {

 int get IdContribution; int get IdUser1; int get IdUser2; DateTime get Date;
/// Create a copy of Transactions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsCopyWith<Transactions> get copyWith => _$TransactionsCopyWithImpl<Transactions>(this as Transactions, _$identity);

  /// Serializes this Transactions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transactions&&(identical(other.IdContribution, IdContribution) || other.IdContribution == IdContribution)&&(identical(other.IdUser1, IdUser1) || other.IdUser1 == IdUser1)&&(identical(other.IdUser2, IdUser2) || other.IdUser2 == IdUser2)&&(identical(other.Date, Date) || other.Date == Date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,IdContribution,IdUser1,IdUser2,Date);

@override
String toString() {
  return 'Transactions(IdContribution: $IdContribution, IdUser1: $IdUser1, IdUser2: $IdUser2, Date: $Date)';
}


}

/// @nodoc
abstract mixin class $TransactionsCopyWith<$Res>  {
  factory $TransactionsCopyWith(Transactions value, $Res Function(Transactions) _then) = _$TransactionsCopyWithImpl;
@useResult
$Res call({
 int IdContribution, int IdUser1, int IdUser2, DateTime Date
});




}
/// @nodoc
class _$TransactionsCopyWithImpl<$Res>
    implements $TransactionsCopyWith<$Res> {
  _$TransactionsCopyWithImpl(this._self, this._then);

  final Transactions _self;
  final $Res Function(Transactions) _then;

/// Create a copy of Transactions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? IdContribution = null,Object? IdUser1 = null,Object? IdUser2 = null,Object? Date = null,}) {
  return _then(_self.copyWith(
IdContribution: null == IdContribution ? _self.IdContribution : IdContribution // ignore: cast_nullable_to_non_nullable
as int,IdUser1: null == IdUser1 ? _self.IdUser1 : IdUser1 // ignore: cast_nullable_to_non_nullable
as int,IdUser2: null == IdUser2 ? _self.IdUser2 : IdUser2 // ignore: cast_nullable_to_non_nullable
as int,Date: null == Date ? _self.Date : Date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Transactions implements Transactions {
  const _Transactions({required this.IdContribution, required this.IdUser1, required this.IdUser2, required this.Date});
  factory _Transactions.fromJson(Map<String, dynamic> json) => _$TransactionsFromJson(json);

@override final  int IdContribution;
@override final  int IdUser1;
@override final  int IdUser2;
@override final  DateTime Date;

/// Create a copy of Transactions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionsCopyWith<_Transactions> get copyWith => __$TransactionsCopyWithImpl<_Transactions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transactions&&(identical(other.IdContribution, IdContribution) || other.IdContribution == IdContribution)&&(identical(other.IdUser1, IdUser1) || other.IdUser1 == IdUser1)&&(identical(other.IdUser2, IdUser2) || other.IdUser2 == IdUser2)&&(identical(other.Date, Date) || other.Date == Date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,IdContribution,IdUser1,IdUser2,Date);

@override
String toString() {
  return 'Transactions(IdContribution: $IdContribution, IdUser1: $IdUser1, IdUser2: $IdUser2, Date: $Date)';
}


}

/// @nodoc
abstract mixin class _$TransactionsCopyWith<$Res> implements $TransactionsCopyWith<$Res> {
  factory _$TransactionsCopyWith(_Transactions value, $Res Function(_Transactions) _then) = __$TransactionsCopyWithImpl;
@override @useResult
$Res call({
 int IdContribution, int IdUser1, int IdUser2, DateTime Date
});




}
/// @nodoc
class __$TransactionsCopyWithImpl<$Res>
    implements _$TransactionsCopyWith<$Res> {
  __$TransactionsCopyWithImpl(this._self, this._then);

  final _Transactions _self;
  final $Res Function(_Transactions) _then;

/// Create a copy of Transactions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? IdContribution = null,Object? IdUser1 = null,Object? IdUser2 = null,Object? Date = null,}) {
  return _then(_Transactions(
IdContribution: null == IdContribution ? _self.IdContribution : IdContribution // ignore: cast_nullable_to_non_nullable
as int,IdUser1: null == IdUser1 ? _self.IdUser1 : IdUser1 // ignore: cast_nullable_to_non_nullable
as int,IdUser2: null == IdUser2 ? _self.IdUser2 : IdUser2 // ignore: cast_nullable_to_non_nullable
as int,Date: null == Date ? _self.Date : Date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
