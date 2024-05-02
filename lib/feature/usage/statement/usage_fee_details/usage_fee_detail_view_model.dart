import 'package:kb_bank_clone/data/local/kb_dao.dart';
import 'package:kb_bank_clone/domain/card_transaction_entity.dart';
import 'package:kb_bank_clone/feature/usage/statement/usage_fee_details/usage_fee_detail_state.dart';
import 'package:kb_bank_clone/utils/reactive/arc_subject.dart';
import 'package:kb_bank_clone/utils/timeUtils.dart';
import 'package:kb_bank_clone/viewmodel_interface.dart';

class UsageFeeDetailsViewModel implements ViewModelInterface {
  UsageFeeDetailsViewModel({required this.dao});

  final KbDao dao;
  final uiState = UsageFeeDetailState(items: []).sbj;

  void collectCardTransactions(int year, int month) {
    final queryTimeStamp = TimeUtils.getStartAndEndTimestamps(year, month);

    dao.flowCardTransactions(queryTimeStamp[0], queryTimeStamp[1]).map((event) {
      final header = CardTransactionHeader(
        totalFee: event.fold<int>(
          0,
          (previousValue, element) => previousValue + element.usageAmount,
        ),
        transactionCount: event.length,
      );
      final contents = event
          .map(
            (e) => CardTransactionContent(
              entity: CardTransactionEntity(
                  id: e.id!,
                  merchantName: e.merchantName,
                  usageAmount: e.usageAmount,
                  transactionAmount: e.transactionAmount,
                  rewardPoints: e.rewardPoints,
                  installmentStart: e.installmentStart,
                  installmentEnd: e.installmentEnd,
                  interestFreeBenefit: e.interestFreeBenefit,
                  commissionOrInterest: e.commissionOrInterest,
                  balanceAfterPayment: e.balanceAfterPayment,
                  transactionType: e.transactionType,
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
