import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi-Screen App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutScreen()),
                  ),
              child: Text('About'),
            ),
            ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactListScreen(),
                    ),
                  ),
              child: Text('Contact'),
            ),
            ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  ),
              child: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Center(child: Text('This is the About screen.')),
    );
  }
}

class ContactListScreen extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {'name': 'John Doe', 'phone': '123-456-7890', 'email': 'john@example.com'},
    {
      'name': 'Jane Smith',
      'phone': '987-654-3210',
      'email': 'jane@example.com',
    },
    {
      'name': 'Alice Johnson',
      'phone': '555-666-7777',
      'email': 'alice@example.com',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index]['name']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          ContactDetailScreen(contact: contacts[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ContactDetailScreen extends StatelessWidget {
  final Map<String, String> contact;

  ContactDetailScreen({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact['name']!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${contact['name']}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Phone: ${contact['phone']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Email: ${contact['email']}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(child: Text('This is the Settings screen.')),
    );
  }
}
