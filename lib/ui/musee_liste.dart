import 'package:flutter/material.dart';
import 'package:projet_musee_sqlite_bloc/ui/widgets/card.dart';
import '../repository/MuseeRepository.dart';
import '../database/database.dart';
import '../models/musee.dart';
import 'musee_edit.dart';

class MuseeList extends StatefulWidget {
  const MuseeList({Key? key}) : super(key: key);

  @override
  State<MuseeList> createState() => _MuseeListState();
}

class _MuseeListState extends State<MuseeList> {
  late DatabaseProvider databaseProvider = DatabaseProvider();

  late MuseeRepository _museeRepository;
  late List<Musee> _list;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _list = [];
    databaseProvider = DatabaseProvider();
    _museeRepository = MuseeRepository();
    _refresh();
  }

  void _refresh() async {
    _isLoading = true;
    final data = await _museeRepository.getAllMusees();
    setState(() {
      _list = data;
    });
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return !_isLoading
        ? ListView.builder(
            padding: const EdgeInsets.all(18.0),
            itemCount: _list.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MuseeEdit(musee: _list[index]),
                    ),
                  );
                },
                child: Cadre(
                  title: _list[index].nomMus,
                  total: _list[index].nbLivres,
                  image: 'https://picsum.photos/200/300',
                ),
              );
            },
          )
        : const CircularProgressIndicator();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
