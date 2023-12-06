import 'package:sqflite/sqflite.dart';

class dataSession {
  Future<Database> OpenDB() async {
    final Future<Database> database = openDatabase(
      'remember.db',
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE recordatorio(id INTEGER PRIMARY KEY, titulo TEXT)',
        );
      },
      version: 1,
    );
    return database;
  }

  Future<void> insertData(
    String titulo,
  ) async {
    final Database db = await OpenDB();
    await db.insert(
      'recordatorio',
      {
        'titulo': titulo,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getData() async {
    final Database db = await OpenDB();
    return db.query('recordatorio');
  }

  Future<void> updateData(
    String titulo,
    int id,
  ) async {
    final Database db = await OpenDB();
    await db.update(
      'recordatorio',
      {
        'titulo': titulo,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteData(int id) async {
    final Database db = await OpenDB();
    await db.delete(
      'recordatorio',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAllData() async {
    final Database db = await OpenDB();
    await db.delete('recordatorio');
  }

  Future<void> closeDB() async {
    final Database db = await OpenDB();
    await db.close();
  }

  Future<void> deleteDB() async {
    await deleteDatabase('remember.db');
  }

  Future<void> createDB() async {
    final Future<Database> database = openDatabase(
      'remember.db',
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE recordatorio(id INTEGER PRIMARY KEY, titulo TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> updateDB() async {
    final Future<Database> database = openDatabase(
      'remember.db',
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE recordatorio(id INTEGER PRIMARY KEY, titulo TEXT)',
        );
      },
      version: 2,
    );
  }

  Future<void> deleteTable() async {
    final Database db = await OpenDB();
    await db.execute('DROP TABLE recordatorio');
  }
}
