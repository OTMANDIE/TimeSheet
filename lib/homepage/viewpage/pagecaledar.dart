import 'package:calendar_slider/calendar_slider.dart';
import 'package:flutter/material.dart';

class pagecaledar extends StatelessWidget {
  const pagecaledar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarSlider(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 140)),
          lastDate: DateTime.now().add(Duration(days: 4)),
          selectedDateColor: Colors.white,
          selectedTileBackgroundColor: Colors.black,
          selectedDayPosition: SelectedDayPosition.left,
          onDateSelected: (date) {
            print(date);
          },
        ),
      ],
    );
  }
}
