import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class CardSummary extends Equatable {
  const CardSummary(
    this.id,
    this.totalMinimumPayment,
    this.totalUsageAmount,
    this.revolving,
    this.isWrittenOff,
    this.year,
    this.month,
  );

  factory CardSummary.create({
    required int totalMinimumPayment,
    required int totalUsageAmount,
    required int revolving,
    required bool isWrittenOff,
    required int year,
    required int month,
    int? id,
  }) {
    return CardSummary(
      id,
      totalMinimumPayment,
      totalUsageAmount,
      revolving,
      isWrittenOff,
      year,
      month,
    );
  }

  @primaryKey
  final int? id;

  final int totalMinimumPayment;
  final int totalUsageAmount;
  final int revolving;
  final bool isWrittenOff;
  final int year;
  final int month;

  CardSummary copyWith({
    int? id,
    int? totalMinimumPayment,
    int? totalUsageAmount,
    int? revolving,
    bool? isWrittenOff,
    int? year,
    int? month,
  }) {
    return CardSummary(
      id ?? this.id,
      totalMinimumPayment ?? this.totalMinimumPayment,
      totalUsageAmount ?? this.totalUsageAmount,
      revolving ?? this.revolving,
      isWrittenOff ?? this.isWrittenOff,
      year ?? this.year,
      month ?? this.month,
    );
  }

  @override
  List<Object?> get props => [
        id,
        totalMinimumPayment,
        totalUsageAmount,
        revolving,
        isWrittenOff,
        year,
        month,
      ];
}
