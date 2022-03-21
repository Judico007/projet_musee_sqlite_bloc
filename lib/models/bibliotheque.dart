class Bibliotheque {
  static String table = "Bibliotheque";

  final int id;
  final int numMus;
  final String isbn;
  final String dateAchat;

  const Bibliotheque(
      {required this.id,
      required this.numMus,
      required this.isbn,
      required this.dateAchat});
}
