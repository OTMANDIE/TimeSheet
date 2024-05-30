import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timesheet/data/FirebaseCheck.dart';
import 'package:timesheet/data/Userprovider.dart';
import 'package:timesheet/views/homepage/indexpage.dart';
import 'package:timesheet/views/login/login.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        home: FirebaseCheck(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return const Login();
            }
          },
        ),
      ),
    );
  }
}
