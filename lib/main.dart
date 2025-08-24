import 'package:flutter/material.dart';
import 'package:shooping_app/screens/welcome.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Craft',

      home: const Welcome(), // Use the Welcome screen as the home screen
    );
  }
}
