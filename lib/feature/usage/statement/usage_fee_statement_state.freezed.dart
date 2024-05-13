// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usage_fee_statement_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UsageFeeStatementState {
  int get totalUsageFee => throw _privateConstructorUsedError;
  bool get isWrittenOff => throw _privateConstructorUsedError;
  int get minimumPaymentFee => throw _privateConstructorUsedError;
  DateTime? get writtenDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UsageFeeStatementStateCopyWith<UsageFeeStatementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageFeeStatementStateCopyWith<$Res> {
  factory $UsageFeeStatementStateCopyWith(UsageFeeStatementState value,
          $Res Function(UsageFeeStatementState) then) =
      _$UsageFeeStatementStateCopyWithImpl<$Res, UsageFeeStatementState>;
  @useResult
  $Res call(
      {int totalUsageFee,
      bool isWrittenOff,
      int minimumPaymentFee,
      DateTime? writtenDate});
}

/// @nodoc
class _$UsageFeeStatementStateCopyWithImpl<$Res,
        $Val extends UsageFeeStatementState>
    implements $UsageFeeStatementStateCopyWith<$Res> {
  _$UsageFeeStatementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalUsageFee = null,
    Object? isWrittenOff = null,
    Object? minimumPaymentFee = null,
    Object? writtenDate = freezed,
  }) {
    return _then(_value.copyWith(
      totalUsageFee: null == totalUsageFee
          ? _value.totalUsageFee
          : totalUsageFee // ignore: cast_nullable_to_non_nullable
              as int,
      isWrittenOff: null == isWrittenOff
          ? _value.isWrittenOff
          : isWrittenOff // ignore: cast_nullable_to_non_nullable
              as bool,
      minimumPaymentFee: null == minimumPaymentFee
          ? _value.minimumPaymentFee
          : minimumPaymentFee // ignore: cast_nullable_to_non_nullable
              as int,
      writtenDate: freezed == writtenDate
          ? _value.writtenDate
          : writtenDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsageFeeStatementStateImplCopyWith<$Res>
    implements $UsageFeeStatementStateCopyWith<$Res> {
  factory _$$UsageFeeStatementStateImplCopyWith(
          _$UsageFeeStatementStateImpl value,
          $Res Function(_$UsageFeeStatementStateImpl) then) =
      __$$UsageFeeStatementStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalUsageFee,
      bool isWrittenOff,
      int minimumPaymentFee,
      DateTime? writtenDate});
}

/// @nodoc
class __$$UsageFeeStatementStateImplCopyWithImpl<$Res>
    extends _$UsageFeeStatementStateCopyWithImpl<$Res,
        _$UsageFeeStatementStateImpl>
    implements _$$UsageFeeStatementStateImplCopyWith<$Res> {
  __$$UsageFeeStatementStateImplCopyWithImpl(
      _$UsageFeeStatementStateImpl _value,
      $Res Function(_$UsageFeeStatementStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalUsageFee = null,
    Object? isWrittenOff = null,
    Object? minimumPaymentFee = null,
    Object? writtenDate = freezed,
  }) {
    return _then(_$UsageFeeStatementStateImpl(
      totalUsageFee: null == totalUsageFee
          ? _value.totalUsageFee
          : totalUsageFee // ignore: cast_nullable_to_non_nullable
              as int,
      isWrittenOff: null == isWrittenOff
          ? _value.isWrittenOff
          : isWrittenOff // ignore: cast_nullable_to_non_nullable
              as bool,
      minimumPaymentFee: null == minimumPaymentFee
          ? _value.minimumPaymentFee
          : minimumPaymentFee // ignore: cast_nullable_to_non_nullable
              as int,
      writtenDate: freezed == writtenDate
          ? _value.writtenDate
          : writtenDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$UsageFeeStatementStateImpl implements _UsageFeeStatementState {
  _$UsageFeeStatementStateImpl(
      {required this.totalUsageFee,
      required this.isWrittenOff,
      required this.minimumPaymentFee,
      this.writtenDate});

  @override
  final int totalUsageFee;
  @override
  final bool isWrittenOff;
  @override
  final int minimumPaymentFee;
  @override
  final DateTime? writtenDate;

  @override
  String toString() {
    return 'UsageFeeStatementState(totalUsageFee: $totalUsageFee, isWrittenOff: $isWrittenOff, minimumPaymentFee: $minimumPaymentFee, writtenDate: $writtenDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsageFeeStatementStateImpl &&
            (identical(other.totalUsageFee, totalUsageFee) ||
                other.totalUsageFee == totalUsageFee) &&
            (identical(other.isWrittenOff, isWrittenOff) ||
                other.isWrittenOff == isWrittenOff) &&
            (identical(other.minimumPaymentFee, minimumPaymentFee) ||
                other.minimumPaymentFee == minimumPaymentFee) &&
            (identical(other.writtenDate, writtenDate) ||
                other.writtenDate == writtenDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, totalUsageFee, isWrittenOff, minimumPaymentFee, writtenDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsageFeeStatementStateImplCopyWith<_$UsageFeeStatementStateImpl>
      get copyWith => __$$UsageFeeStatementStateImplCopyWithImpl<
          _$UsageFeeStatementStateImpl>(this, _$identity);
}

abstract class _UsageFeeStatementState implements UsageFeeStatementState {
  factory _UsageFeeStatementState(
      {required final int totalUsageFee,
      required final bool isWrittenOff,
      required final int minimumPaymentFee,
      final DateTime? writtenDate}) = _$UsageFeeStatementStateImpl;

  @override
  int get totalUsageFee;
  @override
  bool get isWrittenOff;
  @override
  int get minimumPaymentFee;
  @override
  DateTime? get writtenDate;
  @override
  @JsonKey(ignore: true)
  _$$UsageFeeStatementStateImplCopyWith<_$UsageFeeStatementStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
