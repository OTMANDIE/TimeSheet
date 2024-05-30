import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timesheet/model/Project.dart';
import 'package:timesheet/model/Task.dart';
import 'package:timesheet/model/user.dart';
import 'package:timesheet/rebostry/UserRepository.dart';

class UserProvider with ChangeNotifier, DiagnosticableTreeMixin {
  User? user;
  static List<Project> _projects = [];
  List<Task> tasks = [];

  late UserRepository _userRepository;

  UserProvider() {
    _userRepository = UserRepository(this);
    _fetchUser();
  }

  List<Project> get projects => _projects;

  void addProject(Project project) {
    _projects.add(project);
    notifyListeners();
  }

  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }
 void addAllTask(List<Task> taskss) {
    tasks.addAll(taskss);
    notifyListeners();
  }
  void removealltasks() {
    tasks.clear();
    notifyListeners();
  }

  void removeProject(Project project) {
    _projects.remove(project);
    notifyListeners();
  }

  void addUserProject(Project project) {
    user?.addProject(project);
    if (user != null) {
      _userRepository.updateUser(user!); // Update in Firestore
      notifyListeners();
    }
  }

  void removeUserProject(Project project) {
    user?.removeProject(project);
    if (user != null) {
      _userRepository.updateUser(user!); // Update in Firestore
      notifyListeners();
    }
  }

  Future<void> _fetchUser() async {
    user = await _userRepository.fetchUser();
    notifyListeners();
  }

  Future<void> addUser(User newUser) async {
    await _userRepository.addUser(newUser);
    user = newUser;
    notifyListeners();
  }

  Future<void> updateUser() async {
    if (user != null) {
      await _userRepository.updateUser(user!);
      notifyListeners();
    }
  }

  Future<void> deleteUser() async {
    if (user != null) {
      await _userRepository.deleteUser(user!);
      user = null;
      notifyListeners();
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<User?>('user', user));
    properties.add(IterableProperty('projects', _projects));
  }
}
