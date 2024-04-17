import 'package:floor/floor.dart';
import 'package:kb_bank_clone/data/local/vo/card_transaction.dart';



@dao
abstract class KbDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCardTransaction(CardTransaction model);

  @delete
  Future<void> deleteCardTransaction(CardTransaction model);

  @Query('SELECT * FROM CardTransaction ORDER BY createdAt')
  Future<List<CardTransaction>> findAllCardTransactions();

  @Query('SELECT * FROM CardTransaction ORDER BY createdAt')
  Stream<List<CardTransaction>> flowCardTransactions();

}
