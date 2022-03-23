import 'dart:convert';

Pays paysFromJson(String str) => Pays.fromJson(json.decode(str));
String paysToJson(Pays data) => json.encode(data.toJson());

class Pays {
  static String table = "Pays";

  final String codePays;
  final int nbHabitant;

  const Pays({required this.codePays, required this.nbHabitant});

  /*
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
  */

  factory Pays.fromJson(Map<String, dynamic> json) => Pays(
        codePays: json["codePays"],
        nbHabitant: json["nbhabitant"],
      );

  Map<String, dynamic> toJson() => {
        "codePays": codePays,
        "nbhabitant": nbHabitant,
      };
}
