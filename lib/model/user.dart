

import 'Project.dart';

class User {
  String _name;
  String _email;
  int _phone;
  String _password;
  bool _isAdmin;
 late List<Project> _projects=[];

  User(this._name, this._email, this._phone, this._password, {bool isAdmin = false})
      : _isAdmin = isAdmin;

  // Getters
  String get name => _name;

  String get email => _email;

  int get phone => _phone;

  String get password => _password;

  bool get isAdmin => _isAdmin;

  // Setters
  set name(String name) {
    _name = name;
  }

  set email(String email) {
    _email = email;
  }

  set phone(int phone) {
    _phone = phone;
  }

  set password(String password) {
    _password = password;
  }

  // Method to configure password
  void config_pass(String pass) {
    _password = pass;
  }
}


