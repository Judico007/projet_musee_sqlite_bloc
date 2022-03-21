class Ouvrage {
  static String table = "Ouvrage";
  final String isbn;
  final String title;
  final int nbPages;
  final String codePays;

  const Ouvrage(
      {required this.isbn,
      required this.title,
      required this.nbPages,
      required this.codePays});
}
