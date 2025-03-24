import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              print('Container tapped!');
            },
            child: Container(
              width: 200,
              height: 100,
              color: Colors.blue,
              child: Center(child: Text("Tap Me")),
            ),
          ),
        ),
      ),
    );
  }
}
