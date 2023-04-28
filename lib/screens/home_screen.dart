import 'package:flutter/material.dart';
import 'package:meow_generator2/screens/cat_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meow Generator',
          style: TextStyle(fontFamily: 'Quicksand'),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Generate Cat'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CatScreen()),
            );
          },
        ),
      ),
    );
  }
}
