import 'task.dart'; 

class Project {
  String name;
  String prot;
  DateTime debut;
  DateTime fin;
  String description;
  List<Task> tasks = [];
  List<Employee> employees = []; 
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

  List<Task> getTasksDate(DateTime date) {
    List<Task> result = [];
    for (Task t in tasks) {
      if (t.dateNow == date) {
        result.add(t);
      }
    }
    return result;
  }

  double getHeurs() {
    Duration difference = fin.difference(debut);
    return (difference.inHours/8).toDouble(); 
  }
}

class Employee {}
