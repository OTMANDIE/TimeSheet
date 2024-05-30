class Task {
  String name;
  String description;
  DateTime dateNow;
  double nbHeures;

  Task({
    required this.name,
    required this.description,
    required this.dateNow,
    required this.nbHeures,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'dateNow': dateNow.toIso8601String(),
      'nbHeures': nbHeures,
    };
  }

  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      name: map['name'],
      description: map['description'],
      dateNow: DateTime.parse(map['dateNow']),
      nbHeures: map['nbHeures'],
    );
  }
}
