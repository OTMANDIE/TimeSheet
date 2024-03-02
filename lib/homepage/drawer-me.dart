import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
class Drawer_timesheet extends StatelessWidget {
  const Drawer_timesheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color:Color.fromARGB(221, 170, 167, 167),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/353759.jpg'),
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/person.png'),
                  ),
                  accountName: Text("nome prenom"),
                  accountEmail: Text("xxxxx@gmail.com"),
                ),
                SizedBox(
                  height: 10,
                ),
                drawerItem(icon: Icons.person, name: "Profile"),
                SizedBox(
                  height: 10,
                ),
                drawerItem(icon: Icons.error, name: "abent"),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    thickness: 1,
                    color: const Color.fromARGB(255, 8, 8, 8),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: BlinkText(
                    "Comunicate",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 32, 25, 25),
                      fontSize: 20,
                    ),
                    beginColor: const Color.fromARGB(255, 27, 27, 27),
                    endColor: Color.fromARGB(255, 255, 254, 253),
                    times: 10,
                    duration: const Duration(seconds: 1),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                drawerItem(icon: Icons.settings, name: "Settings",),
                SizedBox(
                  height: 10,
                ),
                drawerItem(
                    icon: Icons.exit_to_app,
                    name: "Logout",
                    warak: () {
                     // FirebaseAuth.instance.signOut();
                    }),
              ],
            ),
          ),
        ),
      );
  }
   Widget drawerItem(
      {required String name, required IconData icon, Function()? warak}) {
    return GestureDetector(
      onTap: warak,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.black,
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}