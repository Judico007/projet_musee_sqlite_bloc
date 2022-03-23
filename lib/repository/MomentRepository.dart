import '../dao/MomentDao.dart';
import '../models/moment.dart';

class MomentRepository {
  final momentDao = MomentDao();

  Future<List<Moment>> getAllMoment() => momentDao.getMoment();
}
