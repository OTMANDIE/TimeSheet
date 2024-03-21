import 'package:flutter/material.dart';

class Task {
  String name;
  String description;
  DateTime dateNow;
  double nbHeurs;

  Task({
    required this.name,
    required this.description,
    required this.dateNow,
    required this.nbHeurs,
  });
}
