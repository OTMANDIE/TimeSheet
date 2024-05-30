// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:timesheet/views/homepage/indexpage.dart';
// import 'package:timesheet/views/login/login.dart';

// class Auth extends StatelessWidget {
//   const Auth({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return const HomePage();
//         } else {
//           return const Login();
//         }
//       },
//     );
//   }
// }
