import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kb_bank_clone/data/local/kb_database.dart';
import 'package:kb_bank_clone/di/kb_service.dart';
import 'package:kb_bank_clone/feature/usage/statement/usage_fee_details/usage_fee_detail_view_model.dart';
import 'package:kb_bank_clone/feature/usage/statement/usage_fee_statement_view_model.dart';
import 'package:kb_bank_clone/feature/usage/statement/usage_fee_write/usage_fee_write_view_model.dart';

final usageFeeWriteViewModelProvider = Provider.autoDispose<UsageFeeWriteViewModel>((ref) {
  return UsageFeeWriteViewModel(dao: getService<AppDatabase>().kbDao);
});

final usageFeeDetailViewModelProvider = Provider.autoDispose<UsageFeeDetailsViewModel>((ref) {
  return UsageFeeDetailsViewModel(dao: getService<AppDatabase>().kbDao);
});

final usageFeeStatementViewModelProvider = Provider.autoDispose<UsageFeeStatementViewModel>((ref) {
  return UsageFeeStatementViewModel(dao: getService<AppDatabase>().kbDao);
});