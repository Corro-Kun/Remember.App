import 'package:sqflite/sqflite.dart';

class dataCard {
  Future<Database> OpenDB() async {
    final Future<Database> database = openDatabase(
      "C0rr0K4n.db",
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE card(idcard INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, description TEXT, link TEXT, session_idsession INTEGER)",
        );
      },
      version: 1,
    );

    return database;
  }
}
