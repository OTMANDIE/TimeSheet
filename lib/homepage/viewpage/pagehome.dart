import 'package:flutter/material.dart';
import 'package:timesheet/weget/task_item.dart';

class pagehome extends StatelessWidget {
  const pagehome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ListView.builder(
          itemCount: 6,
          itemExtent: 140,
          itemBuilder: (BuildContext context, int index) {
            return Center(child: Item_task(integer: index));
          },
        ),
      ),
    );
  }
}
