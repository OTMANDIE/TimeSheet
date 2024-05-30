import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timesheet/data/Userprovider.dart';
import 'package:timesheet/views/weget/button_name.dart';
import 'package:timesheet/views/weget/imput.dart';
import 'package:timesheet/model/Task.dart';

class View_task extends StatefulWidget {
  const View_task({super.key});

  @override
  _View_taskState createState() => _View_taskState();
}

class _View_taskState extends State<View_task> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _hoursController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _hoursController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _addTask() {
    if (_formKey.currentState!.validate()) {
      final task = Task(
        name: _nameController.text,
        description: _descriptionController.text,
        dateNow: DateTime.parse(_dateController.text),
        nbHeures: double.parse(_hoursController.text),
      );

      final userProvider = context.read<UserProvider>();
      userProvider.addTask(task);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                    "New Task",
                    style: TextStyle(fontSize: 40),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Imput(
                controller: _nameController,
                name: "Name Task",
                vale: 320,
              ),
              SizedBox(
                height: 20,
              ),
              Imput(
                controller: _dateController,
                name: "Date Now",
                vale: 328,
                type: TextInputType.datetime,
                tx: "year-month-day",
              ),
              SizedBox(
                height: 20,
              ),
              Imput(
                controller: _hoursController,
                name: "Number of Hours",
                vale: 300,
                type: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              Imput(
                controller: _descriptionController,
                name: "Description",
                vale: 320,
                type: TextInputType.multiline,
                toul: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Button(
                data: "Add Task",
                fun: _addTask,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
