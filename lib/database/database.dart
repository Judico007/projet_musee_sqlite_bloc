import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/bibliotheque.dart';
import '../models/moment.dart';
import '../models/musee.dart';
import '../models/ouvrage.dart';
import '../models/pays.dart';
import '../models/visiter.dart';

class DatabaseProvider {
  static final DatabaseProvider databaseProvider = DatabaseProvider._();
  DatabaseProvider._();
  //late Database _database;
  static Database? _database;

  factory DatabaseProvider() {
    return DatabaseProvider._();
  }

  Future<Database> get database async {
    //   Directory path = await getApplicationDocumentsDirectory();
    String path = await getDatabasesPath();
    String dbPath = join(path, 'Musee_Database.db');

    _database = await openDatabase(dbPath, version: 1, onCreate: _create);
    return _database!;
  }

  Future _create(Database db, int version) async {
    await db.execute(sqlCreatePaysTable());
    await db.execute(sqlCreateOuvrageTable());
    await db.execute(sqlCreateBibliothequeTable());
    await db.execute(sqlCreateMuseeTable());
    await db.execute(sqlCreateVisiterTable());
    await db.execute(sqlCreateMomentTable());

    await insertDefaultData(db);
  }

  /*
  Future<void> initDB() async {
    // Open the database and store the reference.
    String path = await getDatabasesPath();

    _database = (await openDatabase(join(path, 'Musee_Database.db'),
        onCreate: (db, version) async {
      await db.execute(sqlCreatePaysTable());
      await db.execute(sqlCreateOuvrageTable());
      await db.execute(sqlCreateBibliothequeTable());
      await db.execute(sqlCreateMuseeTable());
      await db.execute(sqlCreateVisiterTable());

      await insertDefaultData(db);

      print("====== DB INITED =======");
    }, version: 1));
  } */

  static String sqlCreatePaysTable() {
    return """
        CREATE TABLE ${Pays.table} (
          codepays TEXT PRIMARY KEY NOT NULL UNIQUE, 
          nbhabitant INTEGER DEFAULT 0
        )
    """;
  }

  static String sqlCreateOuvrageTable() {
    return """
      CREATE TABLE ${Ouvrage.table} (
        isbn TEXT PRIMARY KEY NOT NULL UNIQUE,
        nbpage INTEGER DEFAULT 0,
        titre	TEXT,
        codepays TEXT DEFAULT NULL
      )
    """;
  }

  static String sqlCreateMuseeTable() {
    return """
      CREATE TABLE ${Musee.table} (
        numMus INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nomMus TEXT NOT NULL,
        nblivres	INTEGER DEFAULT 0 ,
        codepays TEXT
      )
      """;
  }

  static String sqlCreateBibliothequeTable() {
    return """
      CREATE TABLE ${Bibliotheque.table} (
        "id" integer PRIMARY KEY NOT NULL,
        "nummus" integer NOT NULL,
        "isbn" varchar NOT NULL,
        "dateachat" varchar
      )
    """;
  }

  static String sqlCreateVisiterTable() {
    return """
    CREATE TABLE ${Visiter.table}(
      "nummus"	INTEGER NOT NULL,
      "jour"	TEXT NOT NULL,
      "nbvisiteurs"	INTEGER DEFAULT 0
    )
    """;
  }

  static String sqlCreateMomentTable() {
    return """
    CREATE TABLE ${Moment.table}(
      "jour"	TEXT NOT NULL
    )
    """;
  }

  Future<void> insertDefaultData(Database db) async {
    List<Pays> countries = [
      const Pays(codePays: "bj", nbHabitant: 12123200),
      const Pays(codePays: "cn", nbHabitant: 1439323),
      const Pays(codePays: "ke", nbHabitant: 71296),
      const Pays(codePays: "ng", nbHabitant: 206139589),
      const Pays(codePays: "ru", nbHabitant: 145934462),
      const Pays(codePays: "tg", nbHabitant: 8278724),
      const Pays(codePays: "us", nbHabitant: 331002650),
    ];

    List<Musee> museums = [
      const Musee(
          numMus: 1, nomMus: "Musée Da Silva", nbLivres: 560, codePays: "bj"),
      const Musee(
          numMus: 2,
          nomMus: "United State of America Museum",
          nbLivres: 36000,
          codePays: "us"),
      const Musee(
          numMus: 3, nomMus: "Musée de Ouidah", nbLivres: 4000, codePays: "bj"),
    ];

    // ---- Insertions -----
    // Pays
    for (var c in countries) {
      await db.insert(Pays.table, c.toMap());
    }

    // Museums
    for (var m in museums) {
      db.insert(Musee.table, m.toMap());
    }
  }
}
