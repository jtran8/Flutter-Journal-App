import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:sqflite/sqflite.dart';
import 'journal_entry_dto.dart';
import '../models/journal_entry.dart';

// Adapted from Exploration: Persistence with SQLite
class DatabaseManager {

  static const String FILE_PATH = 'assets/schema_1.sql.txt';
  static const String DATABASE_FILENAME = 'journal.sqlite3.db';
  static const String SQL_INSERT = 'INSERT INTO journal_entries(title, body, rating, date) VALUES(?, ?, ?, ?)';
  static const String SQL_SELECT = 'SELECT * FROM journal_entries';

  static DatabaseManager _instance;
  final Database db;

  DatabaseManager._({Database database}) : db = database;

  factory DatabaseManager.getInstance() {
    assert(_instance != null);
    return _instance;
  }

  static Future initialize() async {
    String SQL_CREATE_SCHEMA = await rootBundle.loadString(FILE_PATH);
    final db = await openDatabase(DATABASE_FILENAME,
      version: 1,
      onCreate: (Database db, int version) async {
        createTables(db, SQL_CREATE_SCHEMA);
      }
    );
    _instance = DatabaseManager._(database: db);
  }

  static void createTables(Database db, String sql) async {
    await db.execute(sql);
  }

  void saveJournalEntry({JournalEntryDTO dto}) {
    db.transaction( (txn) async {
      await txn.rawInsert(SQL_INSERT,
        [dto.title, dto.body, dto.rating, dto.dateTime.toString()]
      );
    });
  } 

  Future<List<JournalEntry>> journalEntries() async {
    final journalRecords = await db.rawQuery(SQL_SELECT);
    final journalEntries = journalRecords.map( (record) {
      return JournalEntry(
        title: record['title'],
        body: record['body'],
        rating: record['rating'],
        dateTime: DateTime.parse(record['date'])
      );
    }).toList();
    return journalEntries;
  }
}
