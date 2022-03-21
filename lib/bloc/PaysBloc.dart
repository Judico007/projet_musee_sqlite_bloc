import 'dart:async';

import '../models/pays.dart';
import '../repository/PaysRepository.dart';

class PaysBloc {
  //Get instance of the Repository
  final _paysRepository = PaysRepository();

  //Stream controller is the 'Admin' that manages
  //the state of our stream of data like adding
  //new data, change the state of the stream
  //and broadcast it to observers/subscribers
  final _paysController = StreamController<List<Pays>>.broadcast();

  get pays => _paysController.stream;

  PaysBloc() {
    getPays();
  }

  Future<List<Pays>> getPays() async {
    _paysController.sink.add(await _paysRepository.getAllPays());
    return _paysRepository.getAllPays();
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
  Future<bool> getPaysFromOtherTables(String code) async {
    return _paysRepository.getPaysFromOtherTables(code);
  }
  */

  dispose() {
    _paysController.close();
  }
}
