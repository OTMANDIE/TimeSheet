import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timesheet/login/sigin.dart';
import 'package:timesheet/weget/button_name.dart';
import 'package:timesheet/weget/imput.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // WRONG EMAIL
      if (e.code == 'user-not-found') {
        // show error to user
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        // show error to user
        wrongPasswordMessage();
      }
    }
  }

  // wrong email message popup
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Email',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // wrong password message popup
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Password',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
              Imput(
                name: "Email",
                vale: 370,
                controller: _emailController,
              ),
              SizedBox(
                height: 40,
              ),
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
                  signUserIn;
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
}
