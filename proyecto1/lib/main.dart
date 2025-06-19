import 'package:flutter/material.dart';
import 'screens/main_menu.dart';

//flutter start point
void main() {
  runApp(const MyApp());
}

//MyApp provides global config, theme & more
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppGPS',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainMenu(),
    );
  }
}
