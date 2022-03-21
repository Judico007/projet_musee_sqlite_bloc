class Moment {
  static String table = "Moment";

  final String jour;

  const Moment(
      { // required this.id,
      required this.jour});

  Map<String, dynamic> toMap() {
    return {'jour': jour};
  }

  @override
  String toString() {
    return 'Moment{jour: $jour}';
  }
}
