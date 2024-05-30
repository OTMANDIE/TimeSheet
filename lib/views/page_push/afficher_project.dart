import 'package:flutter/material.dart';
class TimeSheetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Sheet'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Project: My Awesome Project',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Priority: High'),
            SizedBox(height: 16),
      
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle "Finish" button press
              },
              child: Text('Finish'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle "Postpone" button press
              },
              child: Text('Postpone'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle "Cancel" button press
              },
              child: Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}