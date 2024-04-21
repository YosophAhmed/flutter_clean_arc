import 'package:flutter/material.dart';

import '../presentation/resources/theme_manger.dart';

class App extends StatelessWidget {
  const App._internal(); // named private constructor

  static const App _instance = App._internal(); // Singleton instance

  factory App() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
    );
  }
}