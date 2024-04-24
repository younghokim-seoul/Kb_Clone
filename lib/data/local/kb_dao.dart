import 'package:floor/floor.dart';
import 'package:kb_bank_clone/data/local/vo/card_transaction.dart';



@dao
abstract class KbDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCardTransaction(CardTransaction model);

  @delete
  Future<void> deleteCardTransaction(CardTransaction model);

  @Query('SELECT * FROM CardTransaction WHERE strftime("%Y", createAt / 1000, "unixepoch") = :year AND strftime("%m", createAt / 1000, "unixepoch") = :month ORDER BY createAt')
  Future<List<CardTransaction>> findAllCardTransactions(String year,String month);

  @Query('SELECT * FROM CardTransaction WHERE strftime("%Y", createAt / 1000, "unixepoch") = :year AND strftime("%m", createAt / 1000, "unixepoch") = :month ORDER BY createAt')
  Stream<List<CardTransaction>> flowCardTransactions(String year,String month);

}
