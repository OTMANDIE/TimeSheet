import 'package:flutter/material.dart';
import 'package:timesheet/views/weget/button_name.dart';
import 'package:timesheet/views/weget/imput.dart';
class View_task extends StatelessWidget {
  const View_task({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(children: [
           Row(
                children: [
                  Icon(
           Icons.arrow_back_ios), 
          
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
          Imput(name: "Name Task" ,vale: 320,),
           SizedBox(
                height: 20,
              ), 
          Imput(name: "Date Now",vale: 328,type: TextInputType.number,tx: "year-month-day",),
           SizedBox(
                height: 20,
              ), 
          Imput(name: "Numder Hours",vale: 300,type: TextInputType.number), SizedBox(
                height: 20,
              ), 
          Imput(name: "Description",vale: 320,type: TextInputType.multiline,toul: 100,),
           SizedBox(
                height: 20,
              ), 
              Button(data: "add task",)
        ],),
      ),
    );
  }
}