import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/word.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final String dbName = 'wordList.db'; // Veritabanı adı
  static final int dbVersion = 1; // Veritabanı versiyonu
  static final String wordTable = "words";

  // Word tablosunu oluşturmak için kullanılacak SQL sorgusu
  static final String createWordTableQuery = '''
    CREATE TABLE IF NOT EXISTS $wordTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      word TEXT NOT NULL,
      meaning TEXT NOT NULL,
      sampleSentence TEXT NOT NULL,
      againNum INTEGER NOT NULL,
      wordType TEXT NOT NULL
    )
  ''';

  // Veritabanı bağlantısını açma metodu
  static Future<Database> openDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);

    return openDatabase(
      path,
      version: dbVersion,
      onCreate: (db, version) async {
        // Veritabanı oluşturulduğunda tabloları da oluştur
        await db.execute(createWordTableQuery);
      },
    );
  }

  // Word tablosuna kayıt ekleme
  static Future<int> insertWord(Word word) async {
    final db = await openDb();
    return await db.insert(wordTable, word.toMap());
  }


  // Word tablosundan kayıt güncelleme
  static Future<int> updateWord(Word word) async {
    final db = await openDb();
    return await db.update(
      wordTable,
      word.toMap(),
      where: 'id = ?',
      whereArgs: [word.id],
    );
  }

  // Word tablosundan kayıt silme
  static Future<int> deleteWord(int id) async {
    final db = await openDb();
    return await db.delete(
      wordTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Word tablosundan tüm kayıtları getirme
  static Future<List<Word>> getAllWords() async {
    final db = await openDb();
    List<Map<String, dynamic>> maps = await db.query(wordTable);
    return List.generate(maps.length, (i) => Word.fromMap(maps[i]));
  }
}
