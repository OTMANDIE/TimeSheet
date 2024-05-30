import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timesheet/data/Userprovider.dart';

import '../../weget/task_item.dart';

class pagehistory extends StatefulWidget {
  const pagehistory({super.key});

  @override
  State<pagehistory> createState() => _pagehistoryState();
}

class _pagehistoryState extends State<pagehistory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        nabar(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: context.watch<UserProvider>().user?.projects.length,
              itemExtent: 140,
              itemBuilder: (BuildContext context, int index) {
                return Center(child: Item_task(project: context.watch<UserProvider>().user!.projects[index] ,));
              },
            ),
          ),
        ),
      ],
    );
  }
}

class nabar extends StatefulWidget {
  const nabar({super.key});

  @override
  State<nabar> createState() => _nabarState();
}

class _nabarState extends State<nabar> {
  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
      height: 70,
     
      child: AnimatedButtonBar(
       padding: EdgeInsets.all(0),
       innerVerticalPadding: 0,
        invertedSelection: true,
        children: [
          ButtonBarEntry( onTap: () => print('First item tapped'), 
              child:Container(
          height: double.infinity,
          alignment: Alignment.center,
    decoration: BoxDecoration(
            border: Border.all(color: Colors.black,width: 2)),
 child: Text("Finished") ,)),
          ButtonBarEntry(onTap: () => print('Second item tapped'), child:Container(
          height: 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black,width: 2))
,child:  Text('Postponed'))),
          ButtonBarEntry(
              onTap: () => print('Third item tapped'), child:Container(
                decoration: BoxDecoration(
            border: Border.all(color: Colors.black,width: 2)),
          height: double.infinity,
          alignment: Alignment.center,
 child:  Text('Cancelled'))),
         
        ],
      ),
    );
// Container(
//       width: double.infinity,
//       height: 80,
//       decoration: BoxDecoration(
//         color: Colors.grey,
//         border: Border.all(color: Colors.black,width: 2)
//       ),
//       child: Row(mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//         Container(
//           height: double.infinity,
//           alignment: Alignment.center,

//           decoration: BoxDecoration(
//             border: Border(right: BorderSide(color: Colors.black,width: 2))
//  ),
//  child: Text("Finished") ,

//         ),
//          Container(
//           alignment: Alignment.center,
//           height: double.infinity,
//           decoration: BoxDecoration(),
//   
  }
}
