import 'dart:async';
import '../models/moment.dart';
import '../repository/MomentRepository.dart';

class MomentBloc {
  //Get instance of the Repository
  final _momentRepository = MomentRepository();

  final _paysController = StreamController<List<Moment>>.broadcast();

  get moment => _paysController.stream;

  MomentBloc() {
    getMoment();
  }

  Future<List<Moment>> getMoment() async {
    _paysController.sink.add(await _momentRepository.getAllMoment());
    return _momentRepository.getAllMoment();
  }

  dispose() {
    _paysController.close();
  }
}
