import 'dart:async';

import 'package:floor/floor.dart';
import 'package:kb_bank_clone/data/local/kb_dao.dart';
import 'package:kb_bank_clone/data/local/type_convert.dart';
import 'package:kb_bank_clone/data/local/vo/card_transaction.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'kb_database.g.dart';

@Database(version: 1, entities: [CardTransaction])
@TypeConverters([DateTimeConverter])
abstract class AppDatabase extends FloorDatabase {
  KbDao get kbDao;
}