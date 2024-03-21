import 'package:circular_profile/circular_profile.dart';
import 'package:flutter/material.dart';

import '../weget/button_name.dart';
import '../weget/imput.dart';
class Add_project extends StatelessWidget {
  const Add_project({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
      // AppBar(
      //   // Add an AppBar with a leading icon button
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back), // Use any icon you like for navigation
      //     onPressed: () {
      //       Navigator.pop(context); // Navigate back to the previous screen
      //     },)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () {
             Navigator.pop(context); 
           },),
                  Text(
                    "Time sheet",
                    style: TextStyle(fontSize: 40),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Imput(
                name: "Project name",
                vale: 310,
              ),
              SizedBox(
                height: 20,
              ),
              Imput(
                name: "Project's priority",
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
