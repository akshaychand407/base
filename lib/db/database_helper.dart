import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'tables.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;
  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    (_databaseHelper == null)
        ? _databaseHelper = DatabaseHelper._createInstance()
        : null;

    return _databaseHelper as DatabaseHelper;
  }

  Future<Database?> get database async {
    (_database == null) ? _database = await initialiseDatabase() : null;
    return _database;
  }

  Future<Database> initialiseDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}vansale_demo.db';
    var appDatabase =
        await openDatabase(path, version: 2, onCreate: _createDbs);
    return appDatabase;
  }

  void _createDbs(Database db, int newVersion) async {
    await db.execute('CREATE TABLE ${Tables.profilePhoto}(id TEXT PRIMARY KEY,'
        '${ProfilePhotoFields.id} TEXT,'
        '${ProfilePhotoFields.title} TEXT,'
        '${ProfilePhotoFields.picture} BLOB'
        ')');
  }
}
