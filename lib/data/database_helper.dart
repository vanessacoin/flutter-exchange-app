import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'exchange.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS exchange_history (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            amount REAL NOT NULL,
            fromCurrency TEXT NOT NULL,
            toCurrency TEXT NOT NULL,
            convertedAmount REAL NOT NULL,
            date TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<List<Map<String, dynamic>>> getExchangeHistory() async {
    final db = await database;
    return await db.query('exchange_history', orderBy: 'date DESC');
  }

  Future<void> insertExchange(Map<String, dynamic> exchange) async {
    final db = await database;
    await db.insert('exchange_history', exchange);
  }
}