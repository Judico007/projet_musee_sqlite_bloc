import 'package:flutter/material.dart';
import '../repository/PaysRepository.dart';
import '../database/database.dart';
import '../models/pays.dart';

class PaysList extends StatefulWidget {
  const PaysList({Key? key}) : super(key: key);

  @override
  State<PaysList> createState() => _PaysListState();
}

class _PaysListState extends State<PaysList> {
  late DatabaseProvider databaseProvider = DatabaseProvider();

  late MuseeRepository _paysRepository;
  late List<Pays> _list;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _list = [];
    databaseProvider = DatabaseProvider();
    _paysRepository = MuseeRepository();
    _refresh();
  }

  void _refresh() async {
    _isLoading = true;
    final data = await _paysRepository.getAllPays();
    setState(() {
      _list = data;
    });
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return !_isLoading
        ? ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) => Card(
              color: Colors.orange[200],
              margin: EdgeInsets.all(15),
              child: ListTile(
                  title: Text(_list[index].codePays),
                  subtitle: Text(
                      "${_list[index].codePays} - ${_list[index].nbHabitant}"),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            icon: const Icon(Icons.edit), onPressed: () {}),
                        IconButton(
                            icon: const Icon(Icons.delete), onPressed: () {}),
                      ],
                    ),
                  )),
            ),
          )
        : const CircularProgressIndicator();
  }
}
