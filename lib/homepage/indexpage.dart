import 'dart:math';
import 'package:circular_profile/circular_profile.dart';
import 'package:flutter/material.dart';
import 'package:navbar_router/navbar_router.dart';
import 'package:timesheet/homepage/drawer-me.dart';
import 'package:timesheet/homepage/viewpage/pagecaledar.dart';
import 'package:timesheet/homepage/viewpage/pagehistory.dart';
import 'package:timesheet/homepage/viewpage/pagehome.dart';
import 'package:timesheet/homepage/viewpage/pageme.dart';
import 'package:timesheet/login/login.dart';
import 'package:timesheet/login/sigin.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List<NavbarItem> items = [
    NavbarItem(Icons.home_outlined, 'Home',
        selectedIcon: Icon(
          Icons.home,
          size: 26,
        )),
    NavbarItem(Icons.calendar_month_outlined, 'Calendar',
        selectedIcon: Icon(
          Icons.calendar_month_rounded,
          size: 26,
        )),
         NavbarItem(Icons.history_outlined, 'History',
        selectedIcon: Icon(
          Icons.history,
          size: 26,
        )),

    NavbarItem(Icons.person_outline, 'Me',
        selectedIcon: Icon(
          Icons.person,
          size: 26,
        )),
  ];

  final Map<int, Map<String, Widget>> _routes = const {
    0: {
      '/': pagehome(),
    },
    1: {
      '/': pagecaledar(),
    },
    2: {
      '/': pagehistory(),
    },
     3: {
      '/': pageme(),
    },
  };
  List<Widget> changericon(int i) {
    if (i == 0) {
      return [IconButton(onPressed: () {}, icon: Icon(Icons.add))];
    } else if (i == 1) {
      return [IconButton(onPressed: () {}, icon: Icon(Icons.print))];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer_timesheet(),
      appBar: AppBar(
        actions:changericon(_currentIndex),
        elevation: 10,
        backgroundColor: Color.fromARGB(221, 170, 167, 167),
        title: Text("Time sheet"),
        leading:  Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
            
            ),
            child: CircularProfile(
              showShadow: false,
image: NetworkImage("https://images.unsplash.com/photo-1671521277748-843a8128f7bb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60"),
),
          ),
        ),
   
      body: NavbarRouter(
        initialIndex: 0,
        errorBuilder: (context) {
          return const Center(child: Text('Error 404'));
        },
        onBackButtonPressed: (isExiting) {
          return isExiting;
        },
        destinationAnimationCurve: Curves.fastOutSlowIn,
        destinationAnimationDuration: 600,
        decoration: NavbarDecoration(navbarType: BottomNavigationBarType.fixed),
        destinations: [
          for (int i = 0; i < items.length; i++)
            DestinationRouter(
              navbarItem: items[i],
              destinations: [
                for (int j = 0; j < _routes[i]!.keys.length; j++)
                  Destination(
                    route: _routes[i]!.keys.elementAt(j),
                    widget: _routes[i]!.values.elementAt(j),
                  ),
              ],
              initialRoute: _routes[i]!.keys.first,
            ),
        ],
        onChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
