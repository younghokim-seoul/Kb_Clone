import 'package:floor/floor.dart';
import 'package:kb_bank_clone/data/local/vo/card_transaction.dart';



@dao
abstract class KbDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCardTransaction(CardTransaction model);

  @delete
  Future<void> deleteCardTransaction(CardTransaction model);

  @Query('SELECT * FROM CardTransaction WHERE strftime("%m", createAt / 1000, "unixepoch") = :month ORDER BY createAt')
  Future<List<CardTransaction>> findAllCardTransactions(String month);

  @Query('SELECT * FROM CardTransaction WHERE strftime("%m", createAt / 1000, "unixepoch") = :month ORDER BY createAt')
  Stream<List<CardTransaction>> flowCardTransactions(String month);

}
