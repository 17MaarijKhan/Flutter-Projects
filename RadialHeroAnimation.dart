import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: RadialHome());
  }
}

class RadialHome extends StatelessWidget {
  const RadialHome({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'images/pic1.jpeg',
      'images/pic2.png',
      'images/pic3.jpeg',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Radial Hero Home")),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            images.map((img) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => RadialDetail(photo: img)),
                  );
                },
                child: Hero(
                  tag: img,
                  child: ClipOval(
                    child: Image.asset(
                      img,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}

class RadialDetail extends StatelessWidget {
  final String photo;
  const RadialDetail({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    final double maxRadius = 150.0;
    final double size = 2.0 * (maxRadius / math.sqrt2);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Hero(
            tag: photo,
            child: ClipOval(
              child: Image.asset(
                photo,
                width: size,
                height: size,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
