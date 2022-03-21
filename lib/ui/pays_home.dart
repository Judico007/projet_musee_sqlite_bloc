import 'package:flutter/material.dart';
import 'package:projet_musee_sqlite_bloc/ui/pays_liste.dart';

class PaysHome extends StatefulWidget {
  const PaysHome({Key? key}) : super(key: key);

  @override
  State<PaysHome> createState() => _PaysHomeState();
}

class _PaysHomeState extends State<PaysHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des pays'),
      ),
      body: const PaysList(),
      floatingActionButton: FloatingActionButton(
        tooltip: "Ajouter",
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
