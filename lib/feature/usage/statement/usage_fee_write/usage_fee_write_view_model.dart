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
        createAt: model.createAt,
        amount: model.amount,
        paymentType: model.paymentType,
        reward: model.reward,
      ),
    );
  }

  @override
  disposeAll() {}

  @override
  loadState(state) {}
}
