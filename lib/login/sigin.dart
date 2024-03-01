import 'package:flutter/material.dart';
import 'package:timesheet/weget/button_name.dart';
import 'package:timesheet/weget/imput.dart';

class sigin extends StatelessWidget {
  const sigin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Add an AppBar with a leading icon button
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Use any icon you like for navigation
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Time sheet",
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: 40,
              ),
              Imput(
                name: "name",
                vale: 370,
              ),
              SizedBox(
                height: 20,
              ),
              Imput(
                name: "Email",
                vale: 370,
                
              ),SizedBox(
                height: 20,
              ),
              Imput(
                name: "phone",
                vale: 360,
                type: TextInputType.phone,
              ),SizedBox(
                height: 20,
              ),
              Imput(
                name: "Password",
                vale: 340,
                
              ),SizedBox(
                height: 20,
              ),
              Imput(
                name: "Confirm Password",
                vale: 280,
                
              ),
             
             SizedBox(
                height: 100,
              ), 
              Button(data: "Sign-in"),
            ],
          ),
        ),
      ),
    );
  }
}
