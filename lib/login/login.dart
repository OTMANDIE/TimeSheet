import 'package:flutter/material.dart';
import 'package:timesheet/login/sigin.dart';
import 'package:timesheet/weget/button_name.dart';
import 'package:timesheet/weget/imput.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
              ),
              Text(
                "Time sheet",
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: 80,
              ),
              Imput(name: "Email", vale: 370),
              SizedBox(
                height: 40,
              ),
              Imput(name: "Password", vale: 340, enaled: true),
              Padding(
                padding: const EdgeInsets.only(right: 271),
                child: TextButton(
                  child: Text("Forget password"),
                  onPressed: () {},
                ),
              ),
              Button(data: "Log-in"),
              Text(
                "or",
                textAlign: TextAlign.center,
              ),
              Button(
                data: "Sign-in",
                fun: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => sigin()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
