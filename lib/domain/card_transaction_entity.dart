import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kb_bank_clone/data/local/vo/transaction_type.dart';

part 'card_transaction_entity.freezed.dart';

@freezed
class CardTransactionEntity with _$CardTransactionEntity {
  factory CardTransactionEntity({
    required int id,
    required String merchantName,
    required int usageAmount,
    required int transactionAmount,
    required int rewardPoints,
    required int installmentStart,
    required int installmentEnd,
    required int interestFreeBenefit,
    required int commissionOrInterest,
    required int balanceAfterPayment,
    required TransactionType transactionType,
    required DateTime createAt,
  }) = _CardTransactionEntity;

factory CardTransactionEntity.empty() => CardTransactionEntity(
    id: -1,
    merchantName: '',
    usageAmount: 0,
    transactionAmount: 0,
    rewardPoints: 0,
    installmentStart: 0,
    installmentEnd: 0,
    interestFreeBenefit: 0,
    commissionOrInterest: 0,
    balanceAfterPayment: 0,
    transactionType: TransactionType.revolving,
    createAt: DateTime.now(),
  );
}

