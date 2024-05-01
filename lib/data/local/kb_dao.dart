import 'package:floor/floor.dart';
import 'package:kb_bank_clone/data/local/vo/card_summary.dart';
import 'package:kb_bank_clone/data/local/vo/card_transaction.dart';

@dao
abstract class KbDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCardTransaction(CardTransaction model);

  @delete
  Future<void> deleteCardTransaction(CardTransaction model);

  @Query(
      'SELECT * FROM CardTransaction WHERE createAt >= :startTimestamp AND createAt < :endTimestamp ORDER BY createAt')
  Future<List<CardTransaction>> findAllCardTransactions(
      int startTimestamp, int endTimestamp);

  @Query(
      'SELECT * FROM CardTransaction WHERE createAt >= :startTimestamp AND createAt < :endTimestamp ORDER BY createAt')
  Stream<List<CardTransaction>> flowCardTransactions(
      int startTimestamp, int endTimestamp);

  /////////////////////////////////////////////////////////

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCardSummary(CardSummary model);

  @Query('SELECT * FROM CardSummary WHERE year = :year AND month = :month')
  Future<CardSummary?> findCardSummary(int year, int month);
}
