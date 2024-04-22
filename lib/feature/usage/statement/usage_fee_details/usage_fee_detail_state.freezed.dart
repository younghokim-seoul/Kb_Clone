// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usage_fee_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UsageFeeDetailState {
  List<CardTransactionItems> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UsageFeeDetailStateCopyWith<UsageFeeDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageFeeDetailStateCopyWith<$Res> {
  factory $UsageFeeDetailStateCopyWith(
          UsageFeeDetailState value, $Res Function(UsageFeeDetailState) then) =
      _$UsageFeeDetailStateCopyWithImpl<$Res, UsageFeeDetailState>;
  @useResult
  $Res call({List<CardTransactionItems> items});
}

/// @nodoc
class _$UsageFeeDetailStateCopyWithImpl<$Res, $Val extends UsageFeeDetailState>
    implements $UsageFeeDetailStateCopyWith<$Res> {
  _$UsageFeeDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CardTransactionItems>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsageFeeDetailStateImplCopyWith<$Res>
    implements $UsageFeeDetailStateCopyWith<$Res> {
  factory _$$UsageFeeDetailStateImplCopyWith(_$UsageFeeDetailStateImpl value,
          $Res Function(_$UsageFeeDetailStateImpl) then) =
      __$$UsageFeeDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CardTransactionItems> items});
}

/// @nodoc
class __$$UsageFeeDetailStateImplCopyWithImpl<$Res>
    extends _$UsageFeeDetailStateCopyWithImpl<$Res, _$UsageFeeDetailStateImpl>
    implements _$$UsageFeeDetailStateImplCopyWith<$Res> {
  __$$UsageFeeDetailStateImplCopyWithImpl(_$UsageFeeDetailStateImpl _value,
      $Res Function(_$UsageFeeDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$UsageFeeDetailStateImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CardTransactionItems>,
    ));
  }
}

/// @nodoc

class _$UsageFeeDetailStateImpl implements _UsageFeeDetailState {
  _$UsageFeeDetailStateImpl({required final List<CardTransactionItems> items})
      : _items = items;

  final List<CardTransactionItems> _items;
  @override
  List<CardTransactionItems> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'UsageFeeDetailState(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsageFeeDetailStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsageFeeDetailStateImplCopyWith<_$UsageFeeDetailStateImpl> get copyWith =>
      __$$UsageFeeDetailStateImplCopyWithImpl<_$UsageFeeDetailStateImpl>(
          this, _$identity);
}

abstract class _UsageFeeDetailState implements UsageFeeDetailState {
  factory _UsageFeeDetailState(
          {required final List<CardTransactionItems> items}) =
      _$UsageFeeDetailStateImpl;

  @override
  List<CardTransactionItems> get items;
  @override
  @JsonKey(ignore: true)
  _$$UsageFeeDetailStateImplCopyWith<_$UsageFeeDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
