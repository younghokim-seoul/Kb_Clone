import 'package:kb_bank_clone/data/local/kb_dao.dart';
import 'package:kb_bank_clone/data/local/vo/card_transaction.dart';
import 'package:kb_bank_clone/domain/card_transaction_entity.dart';
import 'package:kb_bank_clone/viewmodel_interface.dart';

class UsageFeeWriteViewModel implements ViewModelInterface {
  UsageFeeWriteViewModel({required this.dao});

  final KbDao dao;

  Future<void> insertCardTransaction(CardTransactionEntity model) async {
    await dao.insertCardTransaction(
      CardTransaction.create(
          merchantName: model.merchantName,
          usageAmount: model.usageAmount,
          transactionAmount: model.transactionAmount,
          rewardPoints: model.rewardPoints,
          installmentStart: model.installmentStart,
          installmentEnd: model.installmentEnd,
          interestFreeBenefit: model.interestFreeBenefit,
          commissionOrInterest: model.commissionOrInterest,
          balanceAfterPayment: model.balanceAfterPayment,
          transactionType: model.transactionType,
          createAt: model.createAt),
    );
  }

  @override
  disposeAll() {}

  @override
  loadState(state) {}
}
