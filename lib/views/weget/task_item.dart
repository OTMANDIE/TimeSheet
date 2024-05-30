import 'package:flutter/material.dart';
import 'package:timesheet/model/Project.dart';

class Item_task extends StatelessWidget {
 Item_task( {super.key, required this.project});

Project project;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
          color: Color.fromARGB(221, 170, 167, 167),
          borderRadius: BorderRadius.circular(20)),
      width: double.infinity,
      height: 120,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: ListTile(
            title: Text(project.name,style: TextStyle(fontSize: 35),),
            subtitle: Text("tasks${project.tasks.length}",style: TextStyle(fontSize: 20)),
            leading: Icon(Icons.arrow_forward_ios,size: 60,),
          ),
        ),
      ),
    );
  }
}
