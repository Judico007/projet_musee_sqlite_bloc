import 'package:flutter/material.dart';
import 'package:projet_musee_sqlite_bloc/ui/musee_liste.dart';

class MuseeHome extends StatefulWidget {
  const MuseeHome({Key? key}) : super(key: key);

  @override
  State<MuseeHome> createState() => _MuseeHomeState();
}

class _MuseeHomeState extends State<MuseeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Musées'),
      ),
      body: const MuseeList(),
      floatingActionButton: FloatingActionButton(
        tooltip: "Ajouter",
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
