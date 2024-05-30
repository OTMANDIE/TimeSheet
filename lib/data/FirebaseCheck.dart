import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseCheck extends StatefulWidget {
  final Widget Function(BuildContext, AsyncSnapshot<User?>) builder;

  FirebaseCheck({required this.builder});

  @override
  _FirebaseCheckState createState() => _FirebaseCheckState();
}

class _FirebaseCheckState extends State<FirebaseCheck> {
  Future<FirebaseApp>? _initialization;

  @override
  void initState() {
    super.initState();
    _initialization = Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: widget.builder,
          );
        }

        // Si Firebase n'est pas encore initialisé, affichez un écran de chargement
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
