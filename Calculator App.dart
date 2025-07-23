import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String displayText = "";
  String equation = "";

  void onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        equation = "";
        displayText = "";
      } else if (value == "=") {
        try {
          equation = equation.replaceAll('×', '*').replaceAll('÷', '/');
          Parser p = Parser();
          Expression exp = p.parse(equation);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          displayText = eval.toString();
        } catch (e) {
          displayText = "Error";
        }
      } else {
        equation += value;
        displayText = equation;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                displayText,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  ...[
                    ['1', '2', '3', '+'],
                    ['4', '5', '6', '-'],
                    ['7', '8', '9', '×'],
                    ['C', '0', '=', '÷'],
                  ].map((row) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          row.map((symbol) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                onPressed: () => onButtonPressed(symbol),
                                child: Text(
                                  symbol,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(20),
                                  backgroundColor: Colors.white, // Simple color
                                  elevation: 2, // Minimal elevation
                                  shadowColor: Colors.grey, // Light shadow
                                ),
                              ),
                            );
                          }).toList(),
                    );
                  }).toList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
