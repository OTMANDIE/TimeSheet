import 'package:cloud_firestore/cloud_firestore.dart';
import 'Project.dart';

class User {
  String? id;
  String name;
  String email;
  int phone;
  String password;
  bool isAdmin;
  List<Project> projects;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.isAdmin = false,
    this.projects = const [],
  });

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return User(
      id: snapshot.id,
      name: data['name'],
      email: data['email'],
      phone: data['phone'],
      password: data['password'],
      isAdmin: data['isAdmin'],
      projects: (data['projects'] as List)
          .map((project) => Project.fromMap(project))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'isAdmin': isAdmin,
      'projects': projects.map((project) => project.toMap()).toList(),
    };
  }

  void addProject(Project project) {
    projects.add(project);
  }

  void removeProject(Project project) {
    projects.remove(project);
  }
}
