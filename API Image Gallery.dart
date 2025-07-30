import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = "Isolate Demo";
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Photo>> futurePhotos;

  @override
  void initState() {
    super.initState();
    futurePhotos = fetchPhotos(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder<List<Photo>>(
        future: futurePhotos,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('An error occurred!'));
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client.get(
    Uri.parse("https://api.slingacademy.com/v1/sample-data/photos?limit=10"),
  );

  if (response.statusCode == 200) {
    return compute(parsePhotos, response.body);
  } else {
    throw Exception('Failed to load photos');
  }
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody);
  final List<dynamic> photoList = parsed['photos'];
  return photoList.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final int id;
  final String url;
  final String title;
  final String description;
  final int user;

  const Photo({
    required this.id,
    required this.url,
    required this.title,
    required this.description,
    required this.user,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as int,
      url: json['url'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      user: json['user'] as int,
    );
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({super.key, required this.photos});
  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(children: [Image.network(photos[index].url)]),
        );
      },
    );
  }
}
