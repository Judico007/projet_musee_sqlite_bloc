import '../dao/MuseeDao.dart';
import '../models/musee.dart';

class MuseeRepository {
  final museeDao = MuseeDao();

  Future<List<Musee>> getAllMusees() => museeDao.getMusees();

  Future insertMusee(Musee musee) => museeDao.insertMusee(musee);

  Future updateMusee(Musee musee) => museeDao.updateMusee(musee);

  Future deleteMusee(Musee musee) => museeDao.deleteMusee(musee);

/* Future<bool> getPaysFromOtherTables(String code) =>
      paysDao.getPaysFromOtherTables(code);
 */
}
