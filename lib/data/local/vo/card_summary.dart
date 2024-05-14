import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class CardSummary extends Equatable {
  const CardSummary(
    this.id,
    this.totalMinimumPayment,
    this.isWrittenOff,
  );

  factory CardSummary.create({
    required String id,
    required String totalMinimumPayment,
    required bool isWrittenOff,
  }) {
    return CardSummary(
      id,
      totalMinimumPayment,
      isWrittenOff,
    );
  }

  @primaryKey
  final String id;

  final String totalMinimumPayment;
  final bool isWrittenOff;


  CardSummary copyWith({
    String? id,
    String? totalMinimumPayment,
    bool? isWrittenOff,
  }) {
    return CardSummary(
      id ?? this.id,
      totalMinimumPayment ?? this.totalMinimumPayment,
      isWrittenOff ?? this.isWrittenOff,
    );
  }

  @override
  List<Object?> get props => [
        id,
        totalMinimumPayment,
        isWrittenOff,
      ];
}
