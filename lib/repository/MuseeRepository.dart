import '../dao/MuseeDao.dart';
import '../dao/PaysDao.dart';
import '../models/musee.dart';
import '../models/pays.dart';

class MuseeRepository {
  final museeDao = MuseeDao();

  Future getAllMusees() => museeDao.getMusees();

  Future insertMusee(Musee musee) => museeDao.insertMusee(musee);

  Future updateMusee(Musee musee) => museeDao.updateMusee(musee);

  Future deleteMusee(Musee musee) => museeDao.deleteMusee(musee);

/* Future<bool> getPaysFromOtherTables(String code) =>
      paysDao.getPaysFromOtherTables(code);
 */
}
