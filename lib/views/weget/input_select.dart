import 'package:flutter/material.dart';
class ImputSelect extends StatelessWidget {
  final String? name;
  final double? value;
  final bool? enabled;
  final TextInputType? type;
  final Widget? icon;
  final String? hintText;
  final bool? showHint;

  ImputSelect({
    Key? key,
    this.name,
    this.value,
    this.enabled,
    this.type,
    this.icon,
    this.hintText,
    this.showHint = false,
  }) : super(key: key);

  final List<String> priorityItems = [
    'High priority',
    'Medium priority',
    'Low priority'
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (showHint == false && name != null)
            Padding(
              padding: EdgeInsets.only(right: value ?? 0),
              child: Text(
                name!,
                textAlign: TextAlign.right,
              ),
            ),
          SizedBox(height: 8), // Added spacing between Text and DropdownButtonFormField
          Container(
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              decoration: InputDecoration(
                prefixIcon: icon,
                hintText: hintText,
                isDense: true,
                contentPadding: EdgeInsets.all(12), // Increased padding for better spacing
                filled: true,
                fillColor: Colors.grey[200], // Added fillColor for better contrast
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              items: priorityItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select a priority.';
                }
                return null;
              },
              onChanged: (value) {
                // Do something with the selected value if needed
              },
            ),
          ),
        ],
      ),
    );
  }
}
