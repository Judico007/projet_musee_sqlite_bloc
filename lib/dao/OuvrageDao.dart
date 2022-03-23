import '../database/database.dart';
import '../models/ouvrage.dart';

//Ouvrage Data Access Objects
class OuvrageDao {
  final databaseProvider = DatabaseProvider.databaseProvider;

  Future close() async {
    final db = await databaseProvider.database;
    db.close();
  }

  Future<int> insertOuvrage(Ouvrage ouvrage) async {
    final db = await databaseProvider.database;
    return await db.insert(Ouvrage.table, ouvrage.toJson());
  }

  Future<List<Ouvrage>> getOuvrage() async {
    final db = await databaseProvider.database;

    List result = await db.query(Ouvrage.table, orderBy: 'isbn ASC');

    return result.map((json) => Ouvrage.fromJson(json)).toList();
  }

  Future<int> updateOuvrage(Ouvrage ouvrage) async {
    final db = await databaseProvider.database;

    return await db.update(Ouvrage.table, ouvrage.toJson(),
        where: 'isbn = ?', whereArgs: [ouvrage.isbn]);
  }

  Future<int> deleteOuvrage(Ouvrage ouvrage) async {
    final db = await databaseProvider.database;

    return await db
        .delete("OUVRAGE", where: 'isbn = ?', whereArgs: [ouvrage.isbn]);
  }

  Future<bool> getOuvrageFromOtherTables(String ISBN) async {
    final db = await databaseProvider.database;
    var maps =
        await db.query("BIBLIOTHEQUE", where: 'ISBN = ?', whereArgs: [ISBN]);

    if (maps.isNotEmpty) {
      return true;
    } else {
      print("Cet ouvrage n'a pas été utilisé dans une autre table");
      return false;
    }
  }
}
