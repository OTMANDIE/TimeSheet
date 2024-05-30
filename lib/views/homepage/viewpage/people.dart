import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class People extends StatelessWidget {
  final List<String> agents = [ 'Cname', 'Cname', 'Cname', 'Cname', 'Cname', 'Cname', 'Cname', 'Cname'];

  People({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
       
        children: [
          Expanded(
            flex: 1,
            child: Text('Company Agents',style: TextStyle(fontSize: 20))),
          Expanded(
            flex:3 ,
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2)),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                ),
                itemCount: agents.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, size: 50),
                      Text(agents[index]),
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Add your add agent logic here
                },
                icon: Icon(Icons.add),
                label: Text('Add agents'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
  