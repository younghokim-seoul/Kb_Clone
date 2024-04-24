// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_transaction_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CardTransactionEntity {
  int get id => throw _privateConstructorUsedError;
  String get merchantName => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get paymentType => throw _privateConstructorUsedError;
  int get reward => throw _privateConstructorUsedError;
  int get commission => throw _privateConstructorUsedError;
  int get usageAmount => throw _privateConstructorUsedError;
  int get balance => throw _privateConstructorUsedError;
  DateTime get createAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardTransactionEntityCopyWith<CardTransactionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardTransactionEntityCopyWith<$Res> {
  factory $CardTransactionEntityCopyWith(CardTransactionEntity value,
          $Res Function(CardTransactionEntity) then) =
      _$CardTransactionEntityCopyWithImpl<$Res, CardTransactionEntity>;
  @useResult
  $Res call(
      {int id,
      String merchantName,
      int amount,
      String paymentType,
      int reward,
      int commission,
      int usageAmount,
      int balance,
      DateTime createAt});
}

/// @nodoc
class _$CardTransactionEntityCopyWithImpl<$Res,
        $Val extends CardTransactionEntity>
    implements $CardTransactionEntityCopyWith<$Res> {
  _$CardTransactionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? merchantName = null,
    Object? amount = null,
    Object? paymentType = null,
    Object? reward = null,
    Object? commission = null,
    Object? usageAmount = null,
    Object? balance = null,
    Object? createAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      merchantName: null == merchantName
          ? _value.merchantName
          : merchantName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
      reward: null == reward
          ? _value.reward
          : reward // ignore: cast_nullable_to_non_nullable
              as int,
      commission: null == commission
          ? _value.commission
          : commission // ignore: cast_nullable_to_non_nullable
              as int,
      usageAmount: null == usageAmount
          ? _value.usageAmount
          : usageAmount // ignore: cast_nullable_to_non_nullable
              as int,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardTransactionEntityImplCopyWith<$Res>
    implements $CardTransactionEntityCopyWith<$Res> {
  factory _$$CardTransactionEntityImplCopyWith(
          _$CardTransactionEntityImpl value,
          $Res Function(_$CardTransactionEntityImpl) then) =
      __$$CardTransactionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String merchantName,
      int amount,
      String paymentType,
      int reward,
      int commission,
      int usageAmount,
      int balance,
      DateTime createAt});
}

/// @nodoc
class __$$CardTransactionEntityImplCopyWithImpl<$Res>
    extends _$CardTransactionEntityCopyWithImpl<$Res,
        _$CardTransactionEntityImpl>
    implements _$$CardTransactionEntityImplCopyWith<$Res> {
  __$$CardTransactionEntityImplCopyWithImpl(_$CardTransactionEntityImpl _value,
      $Res Function(_$CardTransactionEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? merchantName = null,
    Object? amount = null,
    Object? paymentType = null,
    Object? reward = null,
    Object? commission = null,
    Object? usageAmount = null,
    Object? balance = null,
    Object? createAt = null,
  }) {
    return _then(_$CardTransactionEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      merchantName: null == merchantName
          ? _value.merchantName
          : merchantName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
      reward: null == reward
          ? _value.reward
          : reward // ignore: cast_nullable_to_non_nullable
              as int,
      commission: null == commission
          ? _value.commission
          : commission // ignore: cast_nullable_to_non_nullable
              as int,
      usageAmount: null == usageAmount
          ? _value.usageAmount
          : usageAmount // ignore: cast_nullable_to_non_nullable
              as int,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$CardTransactionEntityImpl implements _CardTransactionEntity {
  _$CardTransactionEntityImpl(
      {required this.id,
      required this.merchantName,
      required this.amount,
      required this.paymentType,
      required this.reward,
      required this.commission,
      required this.usageAmount,
      required this.balance,
      required this.createAt});

  @override
  final int id;
  @override
  final String merchantName;
  @override
  final int amount;
  @override
  final String paymentType;
  @override
  final int reward;
  @override
  final int commission;
  @override
  final int usageAmount;
  @override
  final int balance;
  @override
  final DateTime createAt;

  @override
  String toString() {
    return 'CardTransactionEntity(id: $id, merchantName: $merchantName, amount: $amount, paymentType: $paymentType, reward: $reward, commission: $commission, usageAmount: $usageAmount, balance: $balance, createAt: $createAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardTransactionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.merchantName, merchantName) ||
                other.merchantName == merchantName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.reward, reward) || other.reward == reward) &&
            (identical(other.commission, commission) ||
                other.commission == commission) &&
            (identical(other.usageAmount, usageAmount) ||
                other.usageAmount == usageAmount) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, merchantName, amount,
      paymentType, reward, commission, usageAmount, balance, createAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardTransactionEntityImplCopyWith<_$CardTransactionEntityImpl>
      get copyWith => __$$CardTransactionEntityImplCopyWithImpl<
          _$CardTransactionEntityImpl>(this, _$identity);
}

abstract class _CardTransactionEntity implements CardTransactionEntity {
  factory _CardTransactionEntity(
      {required final int id,
      required final String merchantName,
      required final int amount,
      required final String paymentType,
      required final int reward,
      required final int commission,
      required final int usageAmount,
      required final int balance,
      required final DateTime createAt}) = _$CardTransactionEntityImpl;

  @override
  int get id;
  @override
  String get merchantName;
  @override
  int get amount;
  @override
  String get paymentType;
  @override
  int get reward;
  @override
  int get commission;
  @override
  int get usageAmount;
  @override
  int get balance;
  @override
  DateTime get createAt;
  @override
  @JsonKey(ignore: true)
  _$$CardTransactionEntityImplCopyWith<_$CardTransactionEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
