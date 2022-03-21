import 'dart:async';

import '../models/musee.dart';
import '../repository/MuseeRepository.dart';

class MuseeBloc {
  //Get instance of the Repository
  final _museeRepository = MuseeRepository();

  //Stream controller is the 'Admin' that manages
  //the state of our stream of data like adding
  //new data, change the state of the stream
  //and broadcast it to observers/subscribers
  final _museeController = StreamController<List<Musee>>.broadcast();

  get musees => _museeController.stream;

  MuseeBloc() {
    getMusees();
  }

  Future<List<Musee>> getMusees() async {
    _museeController.sink.add(await _museeRepository.getAllMusees());
    return _museeRepository.getAllMusees();
  }

  addMusee(Musee musee) async {
    await _museeRepository.insertMusee(musee);
    getMusees();
  }

  updateMusee(Musee musee) async {
    await _museeRepository.updateMusee(musee);
    getMusees();
  }

  deleteMusee(Musee musee) async {
    _museeRepository.deleteMusee(musee);
    getMusees();
  }
/*
  Future<bool> getMuseeFromOtherTables(int numMus) async {
    return _museeRepository.getMuseeFromOtherTables(numMus);
  }
  */

  dispose() {
    _museeController.close();
  }
}
