// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kb_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  KbDao? _kbDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CardTransaction` (`id` INTEGER, `merchantName` TEXT NOT NULL, `usageAmount` INTEGER NOT NULL, `transactionAmount` INTEGER NOT NULL, `rewardPoints` INTEGER NOT NULL, `installmentStart` INTEGER NOT NULL, `installmentEnd` INTEGER NOT NULL, `interestFreeBenefit` INTEGER NOT NULL, `commissionOrInterest` INTEGER NOT NULL, `balanceAfterPayment` INTEGER NOT NULL, `transactionType` INTEGER NOT NULL, `createAt` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CardSummary` (`id` TEXT NOT NULL, `totalMinimumPayment` INTEGER NOT NULL, `isWrittenOff` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  KbDao get kbDao {
    return _kbDaoInstance ??= _$KbDao(database, changeListener);
  }
}

class _$KbDao extends KbDao {
  _$KbDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _cardTransactionInsertionAdapter = InsertionAdapter(
            database,
            'CardTransaction',
            (CardTransaction item) => <String, Object?>{
                  'id': item.id,
                  'merchantName': item.merchantName,
                  'usageAmount': item.usageAmount,
                  'transactionAmount': item.transactionAmount,
                  'rewardPoints': item.rewardPoints,
                  'installmentStart': item.installmentStart,
                  'installmentEnd': item.installmentEnd,
                  'interestFreeBenefit': item.interestFreeBenefit,
                  'commissionOrInterest': item.commissionOrInterest,
                  'balanceAfterPayment': item.balanceAfterPayment,
                  'transactionType': item.transactionType.index,
                  'createAt': _dateTimeConverter.encode(item.createAt)
                },
            changeListener),
        _cardSummaryInsertionAdapter = InsertionAdapter(
            database,
            'CardSummary',
            (CardSummary item) => <String, Object?>{
                  'id': item.id,
                  'totalMinimumPayment': item.totalMinimumPayment,
                  'isWrittenOff': item.isWrittenOff ? 1 : 0
                }),
        _cardTransactionDeletionAdapter = DeletionAdapter(
            database,
            'CardTransaction',
            ['id'],
            (CardTransaction item) => <String, Object?>{
                  'id': item.id,
                  'merchantName': item.merchantName,
                  'usageAmount': item.usageAmount,
                  'transactionAmount': item.transactionAmount,
                  'rewardPoints': item.rewardPoints,
                  'installmentStart': item.installmentStart,
                  'installmentEnd': item.installmentEnd,
                  'interestFreeBenefit': item.interestFreeBenefit,
                  'commissionOrInterest': item.commissionOrInterest,
                  'balanceAfterPayment': item.balanceAfterPayment,
                  'transactionType': item.transactionType.index,
                  'createAt': _dateTimeConverter.encode(item.createAt)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CardTransaction> _cardTransactionInsertionAdapter;

  final InsertionAdapter<CardSummary> _cardSummaryInsertionAdapter;

  final DeletionAdapter<CardTransaction> _cardTransactionDeletionAdapter;

  @override
  Future<List<CardTransaction>> findAllCardTransactions(
    int startTimestamp,
    int endTimestamp,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM CardTransaction WHERE createAt >= ?1 AND createAt < ?2 ORDER BY createAt',
        mapper: (Map<String, Object?> row) => CardTransaction(row['id'] as int?, row['merchantName'] as String, row['usageAmount'] as int, row['transactionAmount'] as int, row['rewardPoints'] as int, row['installmentStart'] as int, row['installmentEnd'] as int, row['interestFreeBenefit'] as int, row['commissionOrInterest'] as int, row['balanceAfterPayment'] as int, TransactionType.values[row['transactionType'] as int], _dateTimeConverter.decode(row['createAt'] as int)),
        arguments: [startTimestamp, endTimestamp]);
  }

  @override
  Stream<List<CardTransaction>> flowCardTransactions(
    int startTimestamp,
    int endTimestamp,
  ) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM CardTransaction WHERE createAt >= ?1 AND createAt < ?2 ORDER BY createAt',
        mapper: (Map<String, Object?> row) => CardTransaction(
            row['id'] as int?,
            row['merchantName'] as String,
            row['usageAmount'] as int,
            row['transactionAmount'] as int,
            row['rewardPoints'] as int,
            row['installmentStart'] as int,
            row['installmentEnd'] as int,
            row['interestFreeBenefit'] as int,
            row['commissionOrInterest'] as int,
            row['balanceAfterPayment'] as int,
            TransactionType.values[row['transactionType'] as int],
            _dateTimeConverter.decode(row['createAt'] as int)),
        arguments: [startTimestamp, endTimestamp],
        queryableName: 'CardTransaction',
        isView: false);
  }

  @override
  Future<CardSummary?> findCardSummary(String id) async {
    return _queryAdapter.query('SELECT * FROM CardSummary WHERE id = ?1',
        mapper: (Map<String, Object?> row) => CardSummary(
            row['id'] as String,
            row['totalMinimumPayment'] as int,
            (row['isWrittenOff'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<void> insertCardTransaction(CardTransaction model) async {
    await _cardTransactionInsertionAdapter.insert(
        model, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertCardSummary(CardSummary model) async {
    await _cardSummaryInsertionAdapter.insert(
        model, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteCardTransaction(CardTransaction model) async {
    await _cardTransactionDeletionAdapter.delete(model);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
final _transactionTypeConverter = TransactionTypeConverter();
