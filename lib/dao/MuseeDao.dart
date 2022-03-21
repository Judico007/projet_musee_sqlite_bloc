//Musee Data Access Objects

import 'package:sqflite/sqflite.dart';
import '../database/database.dart';
import '../models/musee.dart';

class MuseeDao {
  final databaseProvider = DatabaseProvider.databaseProvider;

  Future close() async {
    final db = await databaseProvider.database;
    db.close();
  }

  Future<void> insertMusee(Musee musee) async {
    final db = await databaseProvider.database;
    await db.insert(Musee.table, musee.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Musee>> getMusees() async {
    final db = await databaseProvider.database;
    final List<Map<String, dynamic>> maps = await db.query(Musee.table);
    // List result = await db.query(Pays.table, orderBy: 'codePays ASC');
    // print('result getPays $result');
    //return result.map((json) => Pays.fromJson(json)).toList();

    return List.generate(maps.length, (i) {
      return Musee(
        numMus: maps[i]['numMus'],
        nomMus: maps[i]['nomMus'],
        nbLivres: maps[i]['nblivres'],
        codePays: maps[i]['codepays'],
      );
    });
  }

  /*
  Future<Pays> getPaysByCode(String code) async {
    final db = await databaseProvider.database;
    final maps =
        await db.query("PAYS", where: 'codePays = ?', whereArgs: [code]);
    if (maps.isNotEmpty) {
      return Pays.fromJson(maps.first);
    } else {
      print('Not found');
      return Pays.fromJson(maps.first);
    }
  }
  */

  /*
  Future<bool> getPaysFromOtherTables(String code) async {
    final db = await databaseProvider.database;
    var maps =
        await db.query("MUSEE", where: 'codePays = ?', whereArgs: [code]);

    Pays pays = Pays(codePays: '', nbhabitant: 0);
    if (maps.isNotEmpty) {
      pays = Pays.fromJson(maps.first);
      return true;
    } else {
      maps =
          await db.query("OUVRAGE", where: 'codePays = ?', whereArgs: [code]);

      if (maps.isNotEmpty) {
        pays = Pays.fromJson(maps.first);
        return true;
      } else {
        print('Not found');
        return false;
      }
    }
  }
  */

  Future<void> updateMusee(Musee musee) async {
    final db = await databaseProvider.database;
    await db.update(
      Musee.table,
      musee.toMap(),
      where: 'numMus = ?',
      whereArgs: [musee.numMus],
    );
  }

  Future<bool> deleteMusee(Musee musee) async {
    final db = await databaseProvider.database;

    int affectedRowsCount = await db.delete(
      Musee.table,
      where: 'numMus = ?',
      whereArgs: [musee.numMus],
    );
    return affectedRowsCount > 0;
  }
}
