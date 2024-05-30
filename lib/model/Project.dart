

import 'package:timesheet/model/Task.dart';

class Project {
  String name;
  String prot;
  DateTime debut;
  DateTime fin;
  String description;
  List<Task> tasks = [];

  Project({
    required this.name,
    required this.prot,
    required this.debut,
    required this.fin,
    required this.description,
  });

  void addTask(Task task) {
    tasks.add(task);
  }
  void addallTask(List<Task> sk) {
    tasks.addAll(sk);
  }

  List<Task> getTasksDate(DateTime date) {
    return tasks.where((t) => t.dateNow == date).toList();
  }

  double getHeures() {
    Duration difference = fin.difference(debut);
    return (difference.inHours / 8).toDouble();
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'prot': prot,
      'debut': debut.toIso8601String(),
      'fin': fin.toIso8601String(),
      'description': description,
      'tasks': tasks.map((task) => task.toMap()).toList(),
    };
  }

  static Project fromMap(Map<String, dynamic> map) {
    return Project(
      name: map['name'],
      prot: map['prot'],
      debut: DateTime.parse(map['debut']),
      fin: DateTime.parse(map['fin']),
      description: map['description'],
    )..tasks = (map['tasks'] as List).map((task) => Task.fromMap(task)).toList();
  }
}
