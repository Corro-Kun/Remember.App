import 'package:remember_app/models/sessionModel.dart';
import 'package:sqflite/sqflite.dart';

class dataSession {
  Future<Database> OpenDB() async {
    final Future<Database> database = openDatabase(
      "C0rr0K4n.db",
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE session(idsession INTEGER PRIMARY KEY, title TEXT)",
        );
        db.execute(
          "CREATE TABLE card(idcard INTEGER PRIMARY KEY, name TEXT, description TEXT, link TEXT, isFavorite INTEGER, imagePath TEXT,session_idsession INTEGER, FOREIGN KEY(session_idsession) REFERENCES session(idsession))",
        );
      },
      version: 1,
    );

    return database;
  }

  Future<void> insertSession(String title) async {
    final Database db = await OpenDB();
    await db.insert(
      'session',
      {
        'title': title,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<sessionModel>> getSessions() async {
    final Database db = await OpenDB();
    final List<Map<String, dynamic>> maps = await db.query('session');

    print(maps);

    return List.generate(
      maps.length,
      (i) {
        return sessionModel(
          idsession: maps[i]['idsession'],
          title: maps[i]['title'],
        );
      },
    );
  }

  Future<void> deleteSession(int idsession) async {
    final Database db = await OpenDB();

    print("se elimino la session $idsession");

    await db.delete(
      'card',
      where: 'session_idsession = ?',
      whereArgs: [idsession],
    );

    await db.delete(
      'session',
      where: 'idsession = ?',
      whereArgs: [idsession],
    );
  }
}
