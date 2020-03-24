import 'package:covid19doctorchatbot/home/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green[400],
        fontFamily: 'Montserrat-Regular',
      ),
      home: HomePage(),
    );
  }
}

