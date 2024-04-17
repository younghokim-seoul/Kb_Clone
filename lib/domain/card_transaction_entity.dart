import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_transaction_entity.freezed.dart';

@freezed
class CardTransactionEntity with _$CardTransactionEntity {
  factory CardTransactionEntity({
    required int id,
    required String merchantName,
    required int amount,
    required int paymentType,
    required int reward,
    required DateTime createAt,
  }) = _CardTransactionEntity;

  factory CardTransactionEntity.empty() => CardTransactionEntity(
    id: 0,
    merchantName: '',
    amount: 0,
    paymentType: 0,
    reward: 0,
    createAt: DateTime.now(),
  );
}

