import 'package:flutter/material.dart';
import 'package:kalshi_tha/enter_values/enter_values_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Kalshi THA', home: const EnterValuesScreen());
  }
}
