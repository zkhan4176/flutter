import 'package:flutter/material.dart';

import 'MainScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment # 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),

    );
  }
}