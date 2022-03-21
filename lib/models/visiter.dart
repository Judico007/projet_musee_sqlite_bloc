class Visiter {
  static String table = "Visiter";

  final int numMus;
  final int nbVisiteurs;
  final String jour;

  const Visiter(
      {
      // required this.id,
      required this.nbVisiteurs,
      required this.numMus,
      required this.jour});

  Map<String, dynamic> toMap() {
    return {'nummus': numMus, 'nbvisiteurs': nbVisiteurs, 'jour': jour};
  }

  @override
  String toString() {
    return 'Visiter{numMus: $numMus, nbVisiteur: $nbVisiteurs, jour: $jour}';
  }
}
