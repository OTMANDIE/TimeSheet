import 'package:flutter/material.dart';
import 'package:timesheet/login/login.dart';
import 'package:timesheet/login/sigin.dart';

import 'weget/button_name.dart';
import 'weget/imput.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Login());
  }
}
