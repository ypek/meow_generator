import 'package:flutter/material.dart';
import 'package:meow_generator2/screens/home_screen.dart';

void main() {
  runApp(MeowGeneratorApp());
}

class MeowGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meow Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
