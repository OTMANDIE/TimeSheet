import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.data, this.fun});
  final String data;
  final Function()? fun;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                BeveledRectangleBorder(side: BorderSide(color: Colors.black))),
        onPressed: fun,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ));
  }
}
