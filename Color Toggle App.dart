import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<MyApp> {
  Color _containerColor = Colors.yellow;

  void changeColor() {
    setState(() {
      _containerColor =
          _containerColor == Colors.yellow ? Colors.red : Colors.yellow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Color Toggle App")),
        body: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 200,
            height: 200,
            color: _containerColor,
            child: const Center(
              child: Text(
                "Tap the Button",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: changeColor,
          child: const Icon(Icons.color_lens),
        ),
      ),
    );
  }
}
