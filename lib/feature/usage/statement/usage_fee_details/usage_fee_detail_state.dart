import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kb_bank_clone/domain/card_transaction_entity.dart';

part 'usage_fee_detail_state.freezed.dart';

@freezed
class UsageFeeDetailState with _$UsageFeeDetailState {
  factory UsageFeeDetailState({
    required List<CardTransactionEntity> items,
    required int totalFee,
    required int transactionCount,
  }) = _UsageFeeDetailState;

}
