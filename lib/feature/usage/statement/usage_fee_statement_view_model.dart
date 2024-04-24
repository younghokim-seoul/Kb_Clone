import 'dart:async';

import 'package:kb_bank_clone/data/local/kb_dao.dart';
import 'package:kb_bank_clone/feature/usage/statement/usage_fee_statement_state.dart';
import 'package:kb_bank_clone/main.dart';
import 'package:kb_bank_clone/utils/dev_log.dart';
import 'package:kb_bank_clone/utils/global/payment_add_event.dart';
import 'package:kb_bank_clone/utils/reactive/arc_subject.dart';
import 'package:kb_bank_clone/viewmodel_interface.dart';

class UsageFeeStatementViewModel implements ViewModelInterface {
  UsageFeeStatementViewModel({required this.dao});

  final KbDao dao;

  final currentDateState = DateTime.now().sbj;
  final usageFeeStatementState = ArcSubject<UsageFeeStatementState>();
  StreamSubscription<dynamic>? paymentAddEvent;
  final offsetStart = DateTime(2022, 4);
  final offsetEnd = DateTime(2024, 4, 30);

  void subScribePaymentEvent() {
    paymentAddEvent = eventBus.on<PaymentAddEvent>().listen((event) {
      Log.d(":::PaymentAddEvent event => $event");
      final currentDate = currentDateState.val as DateTime;
      findAllCardTransactions(currentDate.year.toString(), currentDate.month.toString().padLeft(2, '0'));
    });
  }

  Future<void> findAllCardTransactions(String year, String month) async {
    final items = await dao.findAllCardTransactions(year, month);

    final totalFee = items.fold<int>(
      0,
      (previousValue, element) => previousValue + element.amount,
    );
    usageFeeStatementState.val = UsageFeeStatementState(
      totalUsageFee: totalFee,
      writtenDate: items.isNotEmpty ? items.last.createAt : null,
    );

    Log.d(":::usageFeeStatementState ${usageFeeStatementState.val}");
  }

  void changeMonth(ChangeType type) {
    final currentDate = currentDateState.val as DateTime;
    Log.d(":::currentDate $currentDate");
    final changeDate =
        DateTime(currentDate.year, type == ChangeType.plus ? currentDate.month + 1 : currentDate.month - 1, 1);
    Log.d(":::changeDate $changeDate");

    if (changeDate.isBefore(offsetStart) || changeDate.isAfter(offsetEnd)) {
      Log.d(":::changeDate out of range");
      return;
    }

    currentDateState.val = changeDate;

    findAllCardTransactions(currentDate.year.toString(), changeDate.month.toString().padLeft(2, '0'));
  }

  int getYear() {
    final currentDate = currentDateState.val as DateTime;
    return currentDate.year;
  }

  int getMonth() {
    final currentDate = currentDateState.val as DateTime;
    return currentDate.month;
  }

  @override
  disposeAll() {
    paymentAddEvent?.cancel();
    usageFeeStatementState.close();
  }

  @override
  loadState(state) {}
}

enum ChangeType {
  plus,
  minus,
}
