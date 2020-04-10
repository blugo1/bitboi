import 'package:flutter/material.dart';
import 'pages/pricepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff222831),
        scaffoldBackgroundColor: Color(0xff393e46),
      ),
      home: PricePage(),
    );
  }
}
