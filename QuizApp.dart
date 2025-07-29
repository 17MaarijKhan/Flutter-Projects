import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: QuizApp()));
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  String selectedAnswer = "None";

  void _startQuiz() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuizScreen()),
    );

    if (result != null) {
      setState(() {
        selectedAnswer = result;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("You selected: $selectedAnswer")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selected Answer: $selectedAnswer",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _startQuiz, child: Text('Start Quiz')),
          ],
        ),
      ),
    );
  }
}

class QuizScreen extends StatelessWidget {
  final String question = "What is the capital of France?";
  final Map<String, String> options = {
    "A": "Berlin",
    "B": "Paris",
    "C": "Madrid",
    "D": "Rome",
  };
  final String correctAnswer = "B";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz Question")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ...options.entries.map(
              (entry) => ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, entry.key);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Correct Answer: $correctAnswer")),
                  );
                },
                child: Text("${entry.key}: ${entry.value}"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
