import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InteractiveScreen(),
    );
  }
}

class InteractiveScreen extends StatefulWidget {
  const InteractiveScreen({super.key});

  @override
  _InteractiveScreenState createState() => _InteractiveScreenState();
}

class _InteractiveScreenState extends State<InteractiveScreen> {
  // DropdownButton state
  String _selectedItem = 'Option 1';
  final List<String> _dropdownItems = ['Option 1', 'Option 2', 'Option 3'];

  // Radio button state
  String _selectedRadio = 'Male';

  // Slider state
  double _sliderValue = 50.0;

  // Switch state
  bool _isSwitched = false;

  // Checkbox state
  bool _isChecked1 = false;
  bool _isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Material Components UI")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // DropdownButton
            const Text("Select an option:"),
            DropdownButton<String>(
              value: _selectedItem,
              items:
                  _dropdownItems.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),

            // TextButton
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("TextButton Clicked")));
              },
              child: const Text("Click Me"),
            ),
            const SizedBox(height: 20),

            // IconButton
            IconButton(
              icon: const Icon(Icons.thumb_up, color: Colors.blue),
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("IconButton Clicked")));
              },
            ),
            const SizedBox(height: 20),

            // Radio Buttons
            const Text("Select Gender:"),
            Row(
              children: [
                Radio(
                  value: 'Male',
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value.toString();
                    });
                  },
                ),
                const Text("Male"),
                Radio(
                  value: 'Female',
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value.toString();
                    });
                  },
                ),
                const Text("Female"),
              ],
            ),
            const SizedBox(height: 20),

            // Slider
            const Text("Adjust Volume:"),
            Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              divisions: 10,
              label: _sliderValue.round().toString(),
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Enable Notifications:"),
                Switch(
                  value: _isSwitched,
                  onChanged: (value) {
                    setState(() {
                      _isSwitched = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Checkboxes
            const Text("Select Hobbies:"),
            Row(
              children: [
                Checkbox(
                  value: _isChecked1,
                  onChanged: (value) {
                    setState(() {
                      _isChecked1 = value!;
                    });
                  },
                ),
                const Text("Reading"),
                Checkbox(
                  value: _isChecked2,
                  onChanged: (value) {
                    setState(() {
                      _isChecked2 = value!;
                    });
                  },
                ),
                const Text("Traveling"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
