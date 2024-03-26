
import 'package:flutter/material.dart';
import 'package:timesheet/views/homepage/indexpage.dart';
import 'package:timesheet/views/login/login.dart';
import 'package:timesheet/views/login/sigin.dart';

import 'views/login/Autologin.dart';
import 'views/page_push/project_view.dart';
import 'views/weget/button_name.dart';
import 'views/weget/imput.dart';

void main() async{
  //  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Add_project());
        
  }
}
