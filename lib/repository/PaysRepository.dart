import '../dao/PaysDao.dart';
import '../models/pays.dart';

class MuseeRepository {
  final paysDao = PaysDao();

  Future getAllPays() => paysDao.getPays();

  Future insertPays(Pays pays) => paysDao.insertPays(pays);

  Future updatePays(Pays pays) => paysDao.updatePays(pays);

  Future deletePays(Pays pays) => paysDao.deletePays(pays);

  /* Future<bool> getPaysFromOtherTables(String code) =>
      paysDao.getPaysFromOtherTables(code);
 */
}
