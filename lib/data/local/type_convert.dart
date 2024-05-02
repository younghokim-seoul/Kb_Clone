import 'package:floor/floor.dart';
import 'package:kb_bank_clone/data/local/vo/transaction_type.dart';

class DateTimeConverter extends TypeConverter<DateTime, int> {
  @override
  DateTime decode(int databaseValue) {
    return DateTime.fromMillisecondsSinceEpoch(databaseValue);
  }

  @override
  int encode(DateTime value) {
    return value.millisecondsSinceEpoch;
  }
}

class TransactionTypeConverter extends TypeConverter<TransactionType?, String?> {
  @override
  TransactionType? decode(String? databaseValue) {
    return databaseValue == null ? null : TransactionType.values.byName(databaseValue);
  }

  @override
  String? encode(TransactionType? value) {
    return value?.name;
  }
}
