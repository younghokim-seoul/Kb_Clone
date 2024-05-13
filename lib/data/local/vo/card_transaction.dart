import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:kb_bank_clone/data/local/vo/card_transaction.dart';
import 'package:kb_bank_clone/data/local/vo/transaction_type.dart';

@entity
class CardTransaction extends Equatable {
  const CardTransaction(
    this.id,
    this.merchantName,
    this.usageAmount,
    this.transactionAmount,
    this.rewardPoints,
    this.installmentStart,
    this.installmentEnd,
    this.interestFreeBenefit,
    this.commissionOrInterest,
    this.balanceAfterPayment,
    this.transactionType,
    this.createAt,
    this.displayDateTime,
  );

  factory CardTransaction.create({
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
    required DateTime displayDateTime,
    int? id,
  }) {
    return CardTransaction(
      id,
      merchantName,
      usageAmount,
      transactionAmount,
      rewardPoints,
      installmentStart,
      installmentEnd,
      interestFreeBenefit,
      commissionOrInterest,
      balanceAfterPayment,
      transactionType,
      createAt,
      displayDateTime,
    );
  }

  @primaryKey
  final int? id;

  final String merchantName;
  final int usageAmount; //사용금액
  final int transactionAmount; //이용 금액
  final int rewardPoints; // 적립
  final int installmentStart; //할부시작
  final int installmentEnd; //할부끝
  final int interestFreeBenefit; //무이자 혜택
  final int commissionOrInterest; //수수료(이자)
  final int balanceAfterPayment; //결제 후 잔액
  final TransactionType transactionType; //거래 유형
  final DateTime createAt;
  final DateTime displayDateTime;

  CardTransaction copyWith({
    int? id,
    String? merchantName,
    int? usageAmount,
    int? transactionAmount,
    int? rewardPoints,
    int? installmentStart,
    int? installmentEnd,
    int? interestFreeBenefit,
    int? commissionOrInterest,
    int? balanceAfterPayment,
    TransactionType? transactionType,
    DateTime? createAt,
    DateTime? displayDateTime,
  }) {
    return CardTransaction(
      id ?? this.id,
      merchantName ?? this.merchantName,
      usageAmount ?? this.usageAmount,
      transactionAmount ?? this.transactionAmount,
      rewardPoints ?? this.rewardPoints,
      installmentStart ?? this.installmentStart,
      installmentEnd ?? this.installmentEnd,
      interestFreeBenefit ?? this.interestFreeBenefit,
      commissionOrInterest ?? this.commissionOrInterest,
      balanceAfterPayment ?? this.balanceAfterPayment,
      transactionType ?? this.transactionType,
      createAt ?? this.createAt,
      displayDateTime ?? this.displayDateTime,
    );
  }

  @override
  List<Object?> get props => [
        id,
        merchantName,
        usageAmount,
        transactionAmount,
        rewardPoints,
        installmentStart,
        installmentEnd,
        interestFreeBenefit,
        commissionOrInterest,
        balanceAfterPayment,
        transactionType,
        createAt,
        displayDateTime
      ];
}
