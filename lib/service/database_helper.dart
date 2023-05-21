import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static final _dbName = "woofyeApp.db";
  static final _dbVersion = 1;

  DatabaseHelper._internal();
  static final DatabaseHelper databaseHelper = DatabaseHelper._internal();
  static DatabaseHelper get instance => databaseHelper;

  static Database? _database;

  Future<Database?> get database async{
    if(_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, _dbName);
    return await openDatabase(path,
        version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE User(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
        email TEXT,
        password TEXT,
        plan TEXT
      )
    ''');
}
}