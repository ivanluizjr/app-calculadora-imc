import 'package:flutter/material.dart';
import '../view/input_page.dart';

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: Color(0xff090C22),
      ),
      home: InputPage(),
    );
  }
}
