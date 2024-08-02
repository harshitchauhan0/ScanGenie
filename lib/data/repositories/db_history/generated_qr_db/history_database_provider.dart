import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'history_item.dart';
import 'package:scangenie/utils/constants/db_constants.dart';

class HistoryDatabaseProvider {
  static final HistoryDatabaseProvider instance = HistoryDatabaseProvider._();
  static Database? _database;

  HistoryDatabaseProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(),DbConstants.historyDb);
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE history (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          date TEXT,
          qrImage TEXT
        )
      ''');
    });
  }

  Future<void> insertHistoryItem(HistoryItem item) async {
    final db = await database;
    await db.insert('history', item.toMap());
  }

  Future<List<HistoryItem>> getHistoryItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
    await db.query('history', orderBy: 'date ASC');
    return List.generate(maps.length, (i) {
      return HistoryItem.fromMap(maps[i]);
    });
  }

  Future<void> deleteHistoryItem(int id) async {
    try {
      final db = await HistoryDatabaseProvider.instance.database;
      await db.delete('history', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      rethrow;
    }
  }
}