import 'package:circular_profile/circular_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timesheet/data/Userprovider.dart';
import 'package:timesheet/views/weget/add_task.dart';
import 'package:timesheet/views/weget/input_select.dart';

import '../weget/add_agents.dart';
import '../weget/button_name.dart';
import '../weget/imput.dart';
import 'package:timesheet/model/Project.dart';
import 'package:timesheet/model/user.dart';

class Add_project extends StatefulWidget {
  const Add_project({super.key});

  @override
  _Add_projectState createState() => _Add_projectState();
}

class _Add_projectState extends State<Add_project> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _protController = TextEditingController();
  final TextEditingController _debutController = TextEditingController();
  final TextEditingController _finController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _protController.dispose();
    _debutController.dispose();
    _finController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Color.fromARGB(221, 170, 167, 167),
        title: Text("Time sheet"),
        leading: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(),
          child: CircularProfile(
            showShadow: false,
            image: NetworkImage(
                "https://images.unsplash.com/photo-1671521277748-843a8128f7bb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60"),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                      width: 60,
                    ),
                    Text(
                      "New Project",
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Imput(
                  controller: _nameController,
                  name: "Project name",
                  vale: 310,
                ),
                SizedBox(
                  height: 20,
                ),
                Imput(
                  controller: _protController,
                  name: "Project's priority",
                  vale: 290,
                ),
                SizedBox(
                  height: 20,
                ),
                Imput(
                  controller: _debutController,
                  name: "Date Debut",
                  vale: 330,
                  tx: "year-month-day",
                  type: TextInputType.datetime,
                ),
                SizedBox(
                  height: 20,
                ),
                Imput(
                  controller: _finController,
                  name: "Date fin",
                  vale: 350,
                  tx: "year-month-day",
                  type: TextInputType.datetime,
                ),
                SizedBox(
                  height: 20,
                ),
                Add_Agents(),
                SizedBox(
                  height: 20,
                ),
                Add_task(),
                Button(
                  data: "Add Project",
                  fun: () {
                    if (_formKey.currentState!.validate()) {
                      final project = Project(
                        name: _nameController.text,
                        prot: _protController.text,
                        debut: DateTime.parse(_debutController.text),
                        fin: DateTime.parse(_finController.text),
                        description: '',
                      );
                      project.addallTask(context.watch<UserProvider>().tasks);

                      final userProvider = context.read<UserProvider>();
                      final user = userProvider.user;

                      if (user != null) {
                        userProvider.addUserProject(project);
                        userProvider.removealltasks();
                        Navigator.pop(context);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
