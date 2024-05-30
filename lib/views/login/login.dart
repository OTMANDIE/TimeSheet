// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timesheet/views/homepage/indexpage.dart';
import 'package:timesheet/views/login/sigin.dart';
import 'package:timesheet/views/weget/button_name.dart';
import 'package:timesheet/views/weget/imput.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 150),
              Text("Time sheet", style: TextStyle(fontSize: 40)),
              SizedBox(height: 80),
              Imput(
                name: "Email",
                vale: 370,
                controller: _emailController,
              ),
              SizedBox(height: 40),
              Imput(
                name: "Password",
                vale: 340,
                enaled: true,
                controller: _passwordController,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 271),
                child: TextButton(
                  child: Text("Forget password"),
                  onPressed: () {},
                ),
              ),
              Button(
                data: "Log-in",
                fun: () {
                  _signInWithEmailAndPassword();
                },
              ),
              Text(
                "or",
                textAlign: TextAlign.center,
              ),
              Button(
                data: "Sign-in",
                fun: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Sigin()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signInWithEmailAndPassword() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        // Show loading indicator
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signing in...')),
        );

        // Sign in user with email and password
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Hide loading indicator
        ScaffoldMessenger.of(context).hideCurrentSnackBar();

        // Navigate to the next screen after successful sign in
        // You can replace the MaterialPageRoute with your desired screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } catch (e) {
        // Show error message if sign in fails
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to sign in: $e')),
        );
      }
    } else {
      // Show error message if email or password is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter email and password')),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
