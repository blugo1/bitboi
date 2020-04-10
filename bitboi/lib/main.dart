import 'package:flutter/material.dart';
import 'util/constants.dart';
import 'pages/pricepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: darkGrey,
        scaffoldBackgroundColor: lightGrey,
      ),
      home: PricePage(),
    );
  }
}
