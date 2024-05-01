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
            'CREATE TABLE IF NOT EXISTS `CardTransaction` (`id` INTEGER, `merchantName` TEXT NOT NULL, `createAt` INTEGER NOT NULL, `amount` INTEGER NOT NULL, `paymentType` TEXT NOT NULL, `reward` INTEGER NOT NULL, `commission` INTEGER NOT NULL, `usageAmount` INTEGER NOT NULL, `balance` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CardSummary` (`id` INTEGER, `totalMinimumPayment` INTEGER NOT NULL, `totalUsageAmount` INTEGER NOT NULL, `revolving` INTEGER NOT NULL, `isWrittenOff` INTEGER NOT NULL, `year` INTEGER NOT NULL, `month` INTEGER NOT NULL, PRIMARY KEY (`id`))');

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
                  'createAt': _dateTimeConverter.encode(item.createAt),
                  'amount': item.amount,
                  'paymentType': item.paymentType,
                  'reward': item.reward,
                  'commission': item.commission,
                  'usageAmount': item.usageAmount,
                  'balance': item.balance
                },
            changeListener),
        _cardSummaryInsertionAdapter = InsertionAdapter(
            database,
            'CardSummary',
            (CardSummary item) => <String, Object?>{
                  'id': item.id,
                  'totalMinimumPayment': item.totalMinimumPayment,
                  'totalUsageAmount': item.totalUsageAmount,
                  'revolving': item.revolving,
                  'isWrittenOff': item.isWrittenOff ? 1 : 0,
                  'year': item.year,
                  'month': item.month
                }),
        _cardTransactionDeletionAdapter = DeletionAdapter(
            database,
            'CardTransaction',
            ['id'],
            (CardTransaction item) => <String, Object?>{
                  'id': item.id,
                  'merchantName': item.merchantName,
                  'createAt': _dateTimeConverter.encode(item.createAt),
                  'amount': item.amount,
                  'paymentType': item.paymentType,
                  'reward': item.reward,
                  'commission': item.commission,
                  'usageAmount': item.usageAmount,
                  'balance': item.balance
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
        mapper: (Map<String, Object?> row) => CardTransaction(row['id'] as int?, row['merchantName'] as String, _dateTimeConverter.decode(row['createAt'] as int), row['amount'] as int, row['paymentType'] as String, row['reward'] as int, row['commission'] as int, row['usageAmount'] as int, row['balance'] as int),
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
            _dateTimeConverter.decode(row['createAt'] as int),
            row['amount'] as int,
            row['paymentType'] as String,
            row['reward'] as int,
            row['commission'] as int,
            row['usageAmount'] as int,
            row['balance'] as int),
        arguments: [startTimestamp, endTimestamp],
        queryableName: 'CardTransaction',
        isView: false);
  }

  @override
  Future<CardSummary?> findCardSummary(
    int year,
    int month,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM CardSummary WHERE year = ?1 AND month = ?2',
        mapper: (Map<String, Object?> row) => CardSummary(
            row['id'] as int?,
            row['totalMinimumPayment'] as int,
            row['totalUsageAmount'] as int,
            row['revolving'] as int,
            (row['isWrittenOff'] as int) != 0,
            row['year'] as int,
            row['month'] as int),
        arguments: [year, month]);
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
