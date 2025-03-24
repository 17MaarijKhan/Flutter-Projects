import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> products = ["Shirt", "Shoes", "Watch", "Bag"];
  List<String> cart = [];

  void addToCart(String product) {
    setState(() {
      cart.add(product);
    });
  }

  void removeFromCart(String product) {
    setState(() {
      cart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Simple Shopping App")),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(products[index]),
                    trailing: ElevatedButton(
                      onPressed: () => addToCart(products[index]),
                      child: Text("Add to Cart"),
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Text(
              "🛒 Shopping Cart:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(cart[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle, color: Colors.red),
                      onPressed: () => removeFromCart(cart[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
