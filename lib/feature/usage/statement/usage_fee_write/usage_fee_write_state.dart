import 'package:equatable/equatable.dart';
import 'package:kb_bank_clone/domain/card_transaction_entity.dart';

sealed class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object?> get props => [];
}

class RevolvingUpdated extends TransactionEvent {
  const RevolvingUpdated({
    required this.entity,
  });

  final CardTransactionEntity entity;

  @override
  List<Object?> get props => [entity];
}

class InstallmentUpdate extends TransactionEvent {
  const InstallmentUpdate({
    required this.entity,
  });

  final CardTransactionEntity entity;

  @override
  List<Object?> get props => [entity];
}

class AnnualUpdated extends TransactionEvent {
  const AnnualUpdated({
    required this.entity,
  });

  final CardTransactionEntity entity;

  @override
  List<Object?> get props => [entity];
}
