import 'dart:convert';

Visiter visiterFromJson(String str) => Visiter.fromJson(json.decode(str));
String visiterToJson(Visiter data) => json.encode(data.toJson());

class Visiter {
  static String table = "Visiter";

  final int numMus;
  final int nbvisiteurs;
  final String jour;

  const Visiter(
      {
      // required this.id,
      required this.numMus,
      required this.jour,
      required this.nbvisiteurs});

  factory Visiter.fromJson(Map<String, dynamic> json) => Visiter(
        numMus: json["numMus"],
        jour: json["jour"],
        nbvisiteurs: json["nbvisiteurs"],
      );

  Map<String, dynamic> toJson() => {
        "numMus": numMus,
        "jour": jour,
        "nbvisiteurs": nbvisiteurs,
      };

/*
  Map<String, dynamic> toMap() {
    return {'nummus': numMus, 'nbvisiteurs': nbVisiteurs, 'jour': jour};
  }

  @override
  String toString() {
    return 'Visiter{numMus: $numMus, nbVisiteur: $nbVisiteurs, jour: $jour}';
  }

 */
}
