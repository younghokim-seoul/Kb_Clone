import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kb_bank_clone/data/local/kb_database.dart';
import 'package:kb_bank_clone/di/kb_service.dart';
import 'package:kb_bank_clone/feature/usage/statement/usage_fee_write/usage_fee_write_view_model.dart';

final usageFeeWriteViewModelProvider = Provider<UsageFeeWriteViewModel>((ref) {
  return UsageFeeWriteViewModel(dao: getService<AppDatabase>().kbDao);
});
