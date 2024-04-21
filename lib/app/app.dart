import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App._internal(); // named private constructor

  static const App _instance = App._internal(); // Singleton instance

  factory App() => _instance;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}