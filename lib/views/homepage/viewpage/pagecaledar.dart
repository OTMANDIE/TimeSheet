import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../weget/button_name.dart';

class pagecaledar extends StatelessWidget {
  const pagecaledar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Select a Day to see It's Progress",style: TextStyle(fontSize: 20)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2)),
            child: TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2020, 01, 01),
                lastDay: DateTime.utc(2030, 12, 31),
              ),
          ),
        ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Button(data: "Confirm"),
          )
      ],
    );
  }
}
