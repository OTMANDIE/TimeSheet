import 'package:flutter/material.dart';

class Imput extends StatelessWidget {
  final String? name;
  final TextEditingController? controller;
  final double? vale;
  final bool? enaled;
  final TextInputType? type;
  final Widget? icnon;
  final String? tx;
  final bool? shawat;
  final bool? isSelect;

  const Imput(
      {Key? key,
      this.name,
      this.vale,
      this.controller,
      this.enaled,
      this.type,
      this.icnon,
      this.tx,
      this.shawat = false, this.isSelect=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (shawat == false)
            Padding(
              padding: EdgeInsets.only(right: vale ?? 0),
              child: Text(
                name ?? '',
                textAlign: TextAlign.right,
              ),
            ),
          SizedBox(height: 8), // Added spacing between Text and TextField
          Container(
            height:
                35, // Adjusted height for better visibility and touch target
            child: Row(
              children: [
                TextField(
                  keyboardType: type,
                  obscureText: enaled ?? false,
                  controller: controller,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    prefixIcon: icnon,
                    hintText: tx,
                    isDense: true,
                    contentPadding:
                        EdgeInsets.all(12), // Increased padding for better spacing
                    filled: true,
                    fillColor:
                        Colors.grey[200], // Added fillColor for better contrast
                    isCollapsed: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}
