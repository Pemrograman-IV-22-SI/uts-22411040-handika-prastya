import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS Pemrograman 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InputPage(), // Sets InputPage as the home screen
    );
  }
}