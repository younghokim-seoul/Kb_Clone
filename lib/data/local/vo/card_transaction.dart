import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class CardTransaction extends Equatable {
  const CardTransaction(
    this.id,
    this.merchantName,
    this.createAt,
    this.amount,
    this.paymentType,
    this.reward,
    this.commission,
    this.usageAmount,
    this.balance,
  );

  factory CardTransaction.create({
    required String merchantName,
    required DateTime createAt,
    required int amount,
    required String paymentType,
    required int reward,
    required int commission,
    required int usageAmount,
    required int balance,
    int? id,
  }) {
    return CardTransaction(
      id,
      merchantName,
      createAt,
      amount,
      paymentType,
      reward,
      commission,
      usageAmount,
      balance,
    );
  }

  @primaryKey
  final int? id;

  final String merchantName;
  final DateTime createAt;
  final int amount;
  final String paymentType;
  final int reward;
  final int commission;
  final int usageAmount;
  final int balance;

  CardTransaction copyWith({
    int? id,
    String? merchantName,
    DateTime? createAt,
    int? amount,
    String? paymentType,
    int? reward,
    int? commission,
    int? usageAmount,
    int? balance,
  }) {
    return CardTransaction(
      id ?? this.id,
      merchantName ?? this.merchantName,
      createAt ?? this.createAt,
      amount ?? this.amount,
      paymentType ?? this.paymentType,
      reward ?? this.reward,
      commission ?? this.commission,
      usageAmount ?? this.usageAmount,
      balance ?? this.balance,
    );
  }

  @override
  List<Object?> get props => [
        id,
        merchantName,
        createAt,
        amount,
        paymentType,
        reward,
        commission,
        usageAmount,
        balance,
      ];
}
