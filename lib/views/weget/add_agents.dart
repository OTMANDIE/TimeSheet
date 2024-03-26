import 'package:flutter/material.dart';
class Add_Agents extends StatefulWidget {
  const Add_Agents({super.key});

  @override
  State<Add_Agents> createState() => _Add_AgentsState();
}

class _Add_AgentsState extends State<Add_Agents> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 320),
          child: Text("Add agents"),
        ),
        Container(
          height: 90,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.black,width: 2)),
            child: Row(children: [
              Card(child:IconButton(icon: Icon(Icons.person_add),onPressed: (){},) ,shape: Border.all(color: Colors.black,width: 2),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: VerticalDivider(
                      thickness: 3,
                      color: const Color.fromARGB(255, 8, 8, 8),
                    ),
              ),Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: VerticalDivider(
                      thickness: 3,
                      color: const Color.fromARGB(255, 8, 8, 8),
                    ),
              ),
              // ListView.builder(
              //   itemBuilder: ,
              //   scrollDirection: Axis.horizontal,
              //   )
            ],),
        ),
      ],
    );
  }
}
