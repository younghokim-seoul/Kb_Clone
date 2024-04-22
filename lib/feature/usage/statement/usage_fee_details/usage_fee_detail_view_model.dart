import 'package:kb_bank_clone/data/local/kb_dao.dart';
import 'package:kb_bank_clone/domain/card_transaction_entity.dart';
import 'package:kb_bank_clone/feature/usage/statement/usage_fee_details/usage_fee_detail_state.dart';
import 'package:kb_bank_clone/utils/reactive/arc_subject.dart';
import 'package:kb_bank_clone/viewmodel_interface.dart';

class UsageFeeDetailsViewModel implements ViewModelInterface {
  UsageFeeDetailsViewModel({required this.dao});

  final KbDao dao;
  final uiState = UsageFeeDetailState(items: []).sbj;

  void collectCardTransactions(String month) {
    dao.flowCardTransactions(month).map((event) {
      final header = CardTransactionHeader(
        totalFee: event.fold<int>(
          0,
          (previousValue, element) => previousValue + element.amount,
        ),
        transactionCount: event.length,
      );
      final contents = event
          .map(
            (e) => CardTransactionContent(
              entity: CardTransactionEntity(
                  id: e.id!,
                  merchantName: e.merchantName,
                  amount: e.amount,
                  paymentType: e.paymentType,
                  reward: e.reward,
                  createAt: e.createAt),
            ),
          )
          .toList();

      final footer = CardTransactionFooter();

      if (header.transactionCount > 0) {
        return [header, ...contents, footer];
      } else {
        return [header, ...contents];
      }

    }).listen((event) {
      final state = uiState.val as UsageFeeDetailState;
      loadState(state.copyWith(items: event));
    });
  }

  @override
  disposeAll() {
    uiState.close();
  }

  @override
  loadState(state) {
    uiState.val = state;
  }
}
