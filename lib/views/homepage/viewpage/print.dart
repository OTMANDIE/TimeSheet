import 'package:flutter/material.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:timesheet/views/weget/button_name.dart';


class pageme extends StatelessWidget {
  const pageme({super.key});
  @override
  Widget build(BuildContext context) {
    final List<PieData> pies = [
    PieData(value: 0.15, color: Colors.yellow),
    PieData(value: 0.35, color: Colors.cyan),
    PieData(value: 0.45, color: Colors.lightGreen),
  ];
    return Column(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Today's State",style: TextStyle(fontSize: 40), ),
          Container(
            height: 250,
            child: EasyPieChart(
                          children: pies,
                          borderEdge: StrokeCap.square,
                          pieType: PieType.fill,
                          onTap: (index) {},
                          style: const TextStyle(
                              color: Colors.pinkAccent, fontSize: 10),
                          size: 300,
                        ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Button(data: "Print Stats"),
          )
        ],
      );
  }
}
