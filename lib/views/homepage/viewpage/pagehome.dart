import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timesheet/data/Userprovider.dart';
import 'package:timesheet/views/weget/imput.dart';
import 'package:timesheet/views/weget/task_item.dart';

class pagehome extends StatelessWidget {
  const pagehome({super.key});

  @override
  Widget build(BuildContext context) {
 return Column(
      children: [
        Imput(icnon: Icon(Icons.search),
        shawat: true,
        tx: "search",
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: context.watch<UserProvider>().user?.projects.length,
              itemExtent: 140,
              itemBuilder: (BuildContext context, int index) {
                return Center(child: Item_task(project: context.watch<UserProvider>().user!.projects[index],));
              },
            ),
          ),
        ),
    
      ],
    );
  }
}