import 'package:flutter/material.dart';

void main() {
  runApp(MealSelectionApp());
}

class MealSelectionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Selection App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedMeal;

  void _selectMeal(BuildContext context) async {
    final meal = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MealSelectionScreen()),
    );

    if (meal != null) {
      setState(() {
        selectedMeal = meal;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Selected meal: $meal')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('No meal selected.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meal Selection App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _selectMeal(context),
              child: Text('Select a Meal'),
            ),
          ],
        ),
      ),
    );
  }
}

class MealSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose Your Meal')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MealButton(
              meal: 'Pizza',
              description: 'A delicious cheesy delight!',
            ),
            MealButton(
              meal: 'Burger',
              description: 'A juicy beef or veggie burger!',
            ),
            MealButton(
              meal: 'Sushi',
              description: 'Fresh and tasty sushi rolls!',
            ),
          ],
        ),
      ),
    );
  }
}

class MealButton extends StatelessWidget {
  final String meal;
  final String description;

  MealButton({required this.meal, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context, meal);
        },
        onLongPress: () {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: Text(meal),
                  content: Text(description),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ),
          );
        },
        child: Text(meal),
      ),
    );
  }
}
