class Pays {
  static String table = "Pays";

  final String codePays;
  final int nbHabitant;

  const Pays({required this.codePays, required this.nbHabitant});

  // Convertion de Pays en Map. Les clees doivent correspondre aux noms
  // des colonnes de la BD
  Map<String, dynamic> toMap() {
    return {
      'codepays': codePays,
      'nbhabitant': nbHabitant,
    };
  }

  @override
  String toString() {
    // toString redefinie
    return 'Pays{codePays: $codePays, nbHabitants: $nbHabitant}';
  }
}
