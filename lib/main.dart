import 'package:flutter/material.dart';
import 'pages/main_page.dart';

void main() => runApp(KnitTickApp());

class KnitTickApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KnitTick',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(title: 'KnitTick'),
    );
  }
}
