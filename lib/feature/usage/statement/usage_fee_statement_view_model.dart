import 'dart:async';

import 'package:kb_bank_clone/data/local/kb_dao.dart';
import 'package:kb_bank_clone/feature/usage/statement/usage_fee_statement_state.dart';
import 'package:kb_bank_clone/main.dart';
import 'package:kb_bank_clone/utils/dev_log.dart';
import 'package:kb_bank_clone/utils/global/payment_add_event.dart';
import 'package:kb_bank_clone/utils/reactive/arc_subject.dart';
import 'package:kb_bank_clone/utils/timeUtils.dart';
import 'package:kb_bank_clone/viewmodel_interface.dart';

class UsageFeeStatementViewModel implements ViewModelInterface {
  UsageFeeStatementViewModel({required this.dao});

  final KbDao dao;

  final currentDateState = DateTime(2024,4).sbj;
  final usageFeeStatementState = ArcSubject<UsageFeeStatementState>();
  StreamSubscription<dynamic>? paymentAddEvent;
  final offsetStart = DateTime(2022, 4);
  final offsetEnd = DateTime(2024, 4, 30);

  void subScribePaymentEvent() {
    paymentAddEvent = eventBus.on<PaymentAddEvent>().listen((event) {
      Log.d(":::PaymentAddEvent event => $event");
      final currentDate = currentDateState.val as DateTime;
      findAllCardTransactions(currentDate.year, currentDate.month);
    });
  }

  Future<void> findAllCardTransactions(int year, int month) async {
    final queryTimeStamp = TimeUtils.getStartAndEndTimestamps(year, month);

    final items = await dao.findAllCardTransactions(
      queryTimeStamp[0],
      queryTimeStamp[1],
    );

    final totalFee = items.fold<int>(
      0,
      (previousValue, element) => previousValue + element.usageAmount,
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
    final changeDate = DateTime(
        currentDate.year,
        type == ChangeType.plus ? currentDate.month + 1 : currentDate.month - 1,
        1);
    Log.d(":::changeDate $changeDate");

    if (changeDate.isBefore(offsetStart) || changeDate.isAfter(offsetEnd)) {
      Log.d(":::changeDate out of range");
      return;
    }

    currentDateState.val = changeDate;

    findAllCardTransactions(changeDate.year, changeDate.month);
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
