import '../dao/VisiterDao.dart';
import '../models/visiter.dart';

class VisiterRepository {
  final visiterDao = VisiterDao();

  Future getAllVisites() => visiterDao.getVisites();

  Future insertVisite(Visiter visiter) => visiterDao.insertVisite(visiter);

  Future updateVisite(Visiter visiter) => visiterDao.updateVisite(visiter);

  Future deleteVisite(String jour, int numMus) =>
      visiterDao.deleteVisite(jour, numMus);
}
