import 'package:remember_app/models/cardModel.dart';
import 'package:sqflite/sqflite.dart';

class dataCard {
  Future<Database> OpenDB() async {
    final Future<Database> database = openDatabase(
      "C0rr0K4n.db",
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE card(idcard INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, description TEXT, link TEXT, imagePath TEXT,session_idsession INTEGER, FOREIGN KEY(session_idsession) REFERENCES session(idsession))",
        );
      },
      version: 1,
    );

    return database;
  }

  Future<void> insertCard(cardModel card) async {
    final Database db = await OpenDB();
    await db.insert(
      'card',
      {
        'name': card.name,
        'description': card.description,
        'link': card.link,
        'imagePath': card.imagePath,
        'session_idsession': card.session_idsession,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
