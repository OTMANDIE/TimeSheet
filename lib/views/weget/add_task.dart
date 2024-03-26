import 'package:animated_page_transition/animated_page_transition.dart';
import 'package:flutter/material.dart';
import 'package:timesheet/views/page_push/task_view.dart';
class Add_task extends StatefulWidget {
  const Add_task({super.key});

  @override
  State<Add_task> createState() => _Add_taskState();
}

class _Add_taskState extends State<Add_task> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Add Task"),
        PageTransitionButton(
          vsync:this ,
          child:Card(shape: Border.all(color: Colors.black,width: 2),child: Icon(Icons.add),),
          nextPage: View_task(),)
        ],
    );
  }
}
