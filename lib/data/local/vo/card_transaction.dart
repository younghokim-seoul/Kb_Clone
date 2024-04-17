import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class CardTransaction extends Equatable {
  const CardTransaction(this.id, this.merchantName, this.createAt, this.amount, this.paymentType, this.reward);

  factory CardTransaction.create({
    required String merchantName,
    required DateTime createAt,
    required int amount,
    required int paymentType,
    required int reward,
    int? id,
  }) {
    return CardTransaction(
      id,
      merchantName,
      createAt,
      amount,
      paymentType,
      reward,
    );
  }

  @primaryKey
  final int? id;

  final String merchantName;
  final DateTime createAt;
  final int amount;
  final int paymentType;
  final int reward;

  CardTransaction copyWith({
    int? id,
    String? merchantName,
    DateTime? createAt,
    int? amount,
    int? paymentType,
    int? reward,
  }) {
    return CardTransaction(
      id ?? this.id,
      merchantName ?? this.merchantName,
      createAt ?? this.createAt,
      amount ?? this.amount,
      paymentType ?? this.paymentType,
      reward ?? this.reward,
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
      ];
}
