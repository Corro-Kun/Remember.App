import 'package:Reminders/models/cardModel.dart';
import 'package:sqflite/sqflite.dart';

class dataCard {
  Future<Database> OpenDB() async {
    final Future<Database> database = openDatabase(
      "C0rr0K4n.db",
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE session(idsession INTEGER PRIMARY KEY, title TEXT)",
        );
        db.execute(
          "CREATE TABLE card(idcard INTEGER PRIMARY KEY, name TEXT, description TEXT, link TEXT, isFavorite INTEGER ,imagePath TEXT,session_idsession INTEGER, FOREIGN KEY(session_idsession) REFERENCES session(idsession))",
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
        'isFavorite': card.isFavorite,
        'imagePath': card.imagePath,
        'session_idsession': card.session_idsession,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<cardModel>> getCards(int id) async {
    final Database db = await OpenDB();
    final List<Map<String, dynamic>> maps =
        await db.query('card', where: 'session_idsession = ?', whereArgs: [id]);

    // print(maps);

    return List.generate(
      maps.length,
      (i) {
        return cardModel(
          idcard: maps[i]['idcard'],
          name: maps[i]['name'],
          description: maps[i]['description'],
          link: maps[i]['link'],
          isFavorite: maps[i]['isFavorite'],
          imagePath: maps[i]['imagePath'],
          session_idsession: maps[i]['session_idsession'],
        );
      },
    );
  }

  Future<List<cardModel>> getCardsFavorite() async {
    final Database db = await OpenDB();
    final List<Map<String, dynamic>> maps =
        await db.query('card', where: 'isFavorite = ?', whereArgs: [1]);

    // print(maps);

    return List.generate(
      maps.length,
      (i) {
        return cardModel(
          idcard: maps[i]['idcard'],
          name: maps[i]['name'],
          description: maps[i]['description'],
          link: maps[i]['link'],
          isFavorite: maps[i]['isFavorite'],
          imagePath: maps[i]['imagePath'],
          session_idsession: maps[i]['session_idsession'],
        );
      },
    );
  }

  Future<void> updateCard(int value, int id) async {
    final Database db = await OpenDB();
    await db.update(
      'card',
      {
        'isFavorite': value,
      },
      where: 'idcard = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateCardData(cardModel card) async {
    final Database db = await OpenDB();
    await db.update(
      'card',
      {
        'name': card.name,
        'description': card.description,
        'link': card.link,
        'imagePath': card.imagePath,
      },
      where: 'idcard = ?',
      whereArgs: [card.idcard],
    );
  }

  Future<void> deleteCard(int id) async {
    final Database db = await OpenDB();
    await db.delete(
      'card',
      where: 'idcard = ?',
      whereArgs: [id],
    );
  }
}
