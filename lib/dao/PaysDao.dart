//Pays Data Access Objects

import 'package:sqflite/sqflite.dart';

import '../database/database.dart';
import '../models/musee.dart';
import '../models/pays.dart';

class PaysDao {
  final databaseProvider = DatabaseProvider.databaseProvider;

  Future close() async {
    final db = await databaseProvider.database;
    db.close();
  }

  Future<int> insertPays(Pays pays) async {
    final db = await databaseProvider.database;
    return await db.insert(Pays.table, pays.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Pays>> getPays() async {
    final db = await databaseProvider.database;

    final List<Map<String, dynamic>> maps = await db.query(Pays.table);

    //  List result = await db.query(Pays.table, orderBy: 'codePays ASC');
    // print('result getPays $result');
    //return result.map((json) => Pays.fromJson(json)).toList();

    return List.generate(maps.length, (i) {
      return Pays(
        codePays: maps[i]['codepays'],
        nbHabitant: maps[i]['nbhabitant'],
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

  Future<void> updatePays(Pays pays) async {
    final db = await databaseProvider.database;
    await db.update(
      Pays.table,
      pays.toMap(),
      where: 'codePays = ?',
      whereArgs: [pays.codePays],
    );
  }

  Future<bool> deletePays(Pays pays) async {
    final db = await databaseProvider.database;
    // return await db
    //  .delete("PAYS", where: 'codePays = ?', whereArgs: [pays.codePays]);

    int affectedRowsCount = await db.delete(
      Pays.table,
      where: 'codepays = ?',
      whereArgs: [pays.codePays],
    );
    return affectedRowsCount > 0;
  }
}
