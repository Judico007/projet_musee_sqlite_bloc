import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../database/database.dart';
import '../models/musee.dart';
import '../repository/MuseeRepository.dart';

class MuseeEdit extends StatefulWidget {
  const MuseeEdit({Key? key, required this.musee}) : super(key: key);

  final Musee musee;

  @override
  State<MuseeEdit> createState() => _MuseeEditState();
}

class _MuseeEditState extends State<MuseeEdit> {
  final nameController = TextEditingController();
  final nbBookController = TextEditingController();
  final countryController = TextEditingController();
  bool _isSubmitting = false;
  late Musee _musee = widget.musee;

  late DatabaseProvider databaseProvider = DatabaseProvider();

  late MuseeRepository _museeRepository;

  @override
  void initState() {
    super.initState();

    databaseProvider = DatabaseProvider();
    _museeRepository = MuseeRepository();

    _musee = widget.musee;
    _initForm();
  }

  _initForm() {
    setState(() {
      nameController.text = _musee.nomMus;
      nbBookController.text = _musee.nbLivres.toString();
      countryController.text = _musee.codePays;
    });
  }

  _save() async {
    String name = nameController.text;
    String country = countryController.text;
    int booksCount =
        nbBookController.text.isNotEmpty ? int.parse(nbBookController.text) : 0;

    Musee updateMuseum = Musee(
        numMus: _musee.numMus,
        nomMus: name,
        nbLivres: booksCount,
        codePays: country);
    setState(() {
      _isSubmitting = true;
    });

    try {
      //  await _museumService.update(updateMuseum);
      await _museeRepository.updateMusee(updateMuseum);
      Fluttertoast.showToast(
          msg: "Enregistré",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.greenAccent,
          textColor: Colors.black,
          fontSize: 16.0);
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
          msg: "Echec d'enregistrement",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    setState(() {
      _isSubmitting = false;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mise à jour de Musée"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Expanded(
              child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                              hintText: 'Entrez ici...',
                              labelText: 'Nom du musée'),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: nbBookController,
                          decoration: const InputDecoration(
                              hintText: 'Entrez ici',
                              labelText: 'Nombre de livres'),
                        ),
                        TextFormField(
                          controller: countryController,
                          decoration: const InputDecoration(
                              hintText: 'Entrez ici...', labelText: 'Pays'),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: !_isSubmitting
                                      ? ElevatedButton(
                                          child: const Text('Enregitrer'),
                                          onPressed: _save,
                                        )
                                      : const CircularProgressIndicator()),
                            ])
                      ])))
            ],
          )),
        ],
      )),
    );
  }
}
