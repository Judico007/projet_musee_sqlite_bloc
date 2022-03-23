import 'package:flutter/material.dart';
import 'package:projet_musee_sqlite_bloc/main.dart';
import 'package:projet_musee_sqlite_bloc/ui/pays_liste.dart';
import 'package:projet_musee_sqlite_bloc/ui/musee_liste.dart';
import 'package:projet_musee_sqlite_bloc/ui/visite_liste.dart';
import 'bibliotheque_liste.dart';
import 'ouvrage_liste.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //liste de musées affichée par défaut
  var currentPage = DrawerSections.sectionMusees;

  @override
  void initState() {
    super.initState();
  }

  toggleDrawer() async {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.sectionMusees) {
      container = const MuseeList();
    } else if (currentPage == DrawerSections.sectionPays) {
      container = const PaysList();
    } else if (currentPage == DrawerSections.sectionOuvrages) {
      container = const OuvrageList();
    } else if (currentPage == DrawerSections.sectionBibliotheques) {
      container = const BibliothequeList();
    } else if (currentPage == DrawerSections.sectionVisites) {
      container = const VisiteList();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: myColor,
          leading: Builder(
            builder: (context) => IconButton(
                icon: const Icon(
                  Icons.menu,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                }),
          ),
        ),
        drawer: Drawer(
          child: Container(
            padding: const EdgeInsets.only(top: 40, left: 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    // Important
                    padding: EdgeInsets.zero,
                    children: [
                      MyDrawer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Column(
                        children: const [Divider(), Text('')],
                      )),
                )
              ],
            ),
          ),
        ),
        body: container,
      ),
    );
  }

  Widget MyDrawer() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Les Musées",
              currentPage == DrawerSections.sectionMusees ? true : false),
          Divider(),
          menuItem(2, "Les Pays",
              currentPage == DrawerSections.sectionPays ? true : false),
          Divider(),
          menuItem(3, "Les Ouvrages",
              currentPage == DrawerSections.sectionOuvrages ? true : false),
          Divider(),
          menuItem(
              4,
              " Les Bibliothèques",
              currentPage == DrawerSections.sectionBibliotheques
                  ? true
                  : false),
          Divider(),
          menuItem(5, "Les Visites",
              currentPage == DrawerSections.sectionVisites ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, bool selected) {
    return Material(
      child: InkWell(
        onTap: () {
          toggleDrawer();
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.sectionMusees;
            } else if (id == 2) {
              currentPage = DrawerSections.sectionPays;
            } else if (id == 3) {
              currentPage = DrawerSections.sectionOuvrages;
            } else if (id == 4) {
              currentPage = DrawerSections.sectionBibliotheques;
            } else if (id == 5) {
              currentPage = DrawerSections.sectionVisites;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  sectionPays,
  sectionBibliotheques,
  sectionOuvrages,
  sectionMusees,
  sectionVisites,
}
