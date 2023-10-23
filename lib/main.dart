import 'package:flutter/material.dart';
import 'bachelors_main.dart';
import 'models/bachelors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bachelorList = generateurDataBachelor();

    return MaterialApp(
      home: BachelorsMaster(bachelorList: bachelorList),
    );
  }
}
