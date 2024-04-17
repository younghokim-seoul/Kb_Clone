import 'package:kb_bank_clone/data/local/kb_dao.dart';
import 'package:kb_bank_clone/data/local/vo/card_transaction.dart';
import 'package:kb_bank_clone/domain/card_transaction_entity.dart';
import 'package:kb_bank_clone/feature/usage/statement/usage_fee_details/usage_fee_detail_state.dart';
import 'package:kb_bank_clone/utils/dev_log.dart';
import 'package:kb_bank_clone/utils/reactive/arc_subject.dart';
import 'package:kb_bank_clone/viewmodel_interface.dart';

class UsageFeeDetailsViewModel implements ViewModelInterface {
  UsageFeeDetailsViewModel({required this.dao});

  final KbDao dao;
  final state = UsageFeeDetailState(items: [],totalFee: 0,transactionCount: 0).sbj;

  void collectCardTransactions(String month) {
    dao.flowCardTransactions(month).listen((event) {
      Log.d("::::event.. " + event.toString());
    });
  }

  @override
  disposeAll() {}

  @override
  loadState(state) {}
}
