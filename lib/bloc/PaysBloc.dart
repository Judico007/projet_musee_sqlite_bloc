import 'dart:async';

import '../repository/PaysRepository.dart';
import '../models/pays.dart';

class PaysBloc {
  //Get instance of the Repository
  final _paysRepository = MuseeRepository();

  //Stream controller is the 'Admin' that manages
  //the state of our stream of data like adding
  //new data, change the state of the stream
  //and broadcast it to observers/subscribers
  final _todoController = StreamController<List<Pays>>.broadcast();

  get pays => _todoController.stream;

  PaysBloc() {
    getPays();
  }

  getPays() async {
    _todoController.sink.add(await _paysRepository.getAllPays());
  }

  addPays(Pays pays) async {
    await _paysRepository.insertPays(pays);
    getPays();
  }

  updatePays(Pays pays) async {
    await _paysRepository.updatePays(pays);
    getPays();
  }

  deletePays(Pays pays) async {
    _paysRepository.deletePays(pays);
    getPays();
  }
/*
  getPaysFromOtherTables(String code) async {
    _paysRepository.getPaysFromOtherTables(code);
  }*/

  dispose() {
    _todoController.close();
  }
}
