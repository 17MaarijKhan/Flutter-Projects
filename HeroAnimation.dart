import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0; // slow down animation for clarity
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DetailPage()),
            );
          },
          child: Hero(
            tag: 'myHero',
            child: Image.asset('images/flutter.png', width: 150),
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Screen')),
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Hero(
            tag: 'myHero',
            child: Image.asset('images/flutter.png', width: 300),
          ),
        ),
      ),
    );
  }
}
