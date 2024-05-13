import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kb_bank_clone/domain/card_transaction_entity.dart';

part 'usage_fee_detail_state.freezed.dart';

@freezed
class UsageFeeDetailState with _$UsageFeeDetailState {
  factory UsageFeeDetailState({
    required List<CardTransactionItems> items,
  }) = _UsageFeeDetailState;
}

sealed class CardTransactionItems extends Equatable {
  const CardTransactionItems();

  @override
  List<Object?> get props;
}

class CardTransactionHeader extends CardTransactionItems {
  const CardTransactionHeader({
    required this.totalFee,
    required this.transactionCount,
  });

  final int totalFee;
  final int transactionCount;

  @override
  List<Object?> get props => [totalFee, transactionCount];
}

class CardTransactionContent extends CardTransactionItems {
  const CardTransactionContent({
    required this.entity,
  });

  final CardTransactionEntity entity;

  @override
  List<Object?> get props => [entity];
}

class CardTransactionFooter extends CardTransactionItems {
  const CardTransactionFooter({
    required this.transactionCount,
    required this.totalRewardAndMembershipFee,
    required this.revolvingSum,
    required this.totalSum,
  });

  final int transactionCount;
  final int totalRewardAndMembershipFee;
  final int revolvingSum;
  final int totalSum;

  @override
  List<Object?> get props => [
        transactionCount,
        totalRewardAndMembershipFee,
        revolvingSum,
        totalSum,
      ];
}
