class Bibliotheque {
  static String table = "Bibliotheque";

  // final int id;
  final int numMus;
  final String isbn;
  final String dateAchat;

  const Bibliotheque(
      { //required this.id,
      required this.numMus,
      required this.isbn,
      required this.dateAchat});

  factory Bibliotheque.fromJson(Map<String, dynamic> json) => Bibliotheque(
        //  id: json["id"],
        numMus: json["numMus"],
        isbn: json["isbn"],
        dateAchat: json["dateAchat"],
      );

  Map<String, dynamic> toJson() => {
        //  "id": id,
        "numMus": numMus,
        "isbn": isbn,
        "dateAchat": dateAchat,
      };
}
