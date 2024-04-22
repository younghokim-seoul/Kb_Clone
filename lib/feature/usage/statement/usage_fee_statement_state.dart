import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kb_bank_clone/domain/card_transaction_entity.dart';

part 'usage_fee_statement_state.freezed.dart';

@freezed
class UsageFeeStatementState with _$UsageFeeStatementState {
  factory UsageFeeStatementState({
    required int totalUsageFee,
    DateTime? writtenDate,
  }) = _UsageFeeStatementState;
}
