import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_transaction_entity.freezed.dart';

@freezed
class CardTransactionEntity with _$CardTransactionEntity {
  factory CardTransactionEntity({
    required int id,
    required String merchantName,
    required int amount,
    required String paymentType,
    required int reward,
    required int commission,
    required int usageAmount,
    required int balance,
    required DateTime createAt,
  }) = _CardTransactionEntity;

  factory CardTransactionEntity.empty() => CardTransactionEntity(
    id: 0,
    merchantName: '',
    amount: 0,
    paymentType: '',
    reward: 0,
    commission: 0,
    usageAmount: 0,
    balance: 0,
    createAt: DateTime.now(),
  );
}

