import 'package:flutter/material.dart';
import 'package:projet_musee_sqlite_bloc/dao/MuseeDao.dart';
import 'package:projet_musee_sqlite_bloc/ui/home_page.dart';
import 'package:projet_musee_sqlite_bloc/ui/musee_edit.dart';
import 'package:projet_musee_sqlite_bloc/ui/pays_liste.dart';
import 'package:projet_musee_sqlite_bloc/ui/musee_home.dart';
import 'package:projet_musee_sqlite_bloc/ui/pays_home.dart';
import 'package:sqflite/sqflite.dart';

import 'database/database.dart';
import 'models/musee.dart';

void main() async {
  /* WidgetsFlutterBinding.ensureInitialized();
  final databaseProvider = DatabaseProvider.databaseProvider;
  final db = await databaseProvider.database;

  Musee m = const Musee(
    numMus: 1,
    nomMus: 'Musee Hello',
    nbLivres: 2,
    codePays: 'zzz',
  );
*/

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Liste des Pays',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MuseeHome(),
      initialRoute: '/',
      routes: {
        '/': (context) => const MuseeHome(),
        // '/edit_musee': (context) => MuseeEdit(),
        //'/oeuvres': (context) => const Ouevres(),
        // '/create': (context) => CreateView(),
      },
      // const HomePage(title: 'Smart Museum App'),
    );
  }
}
