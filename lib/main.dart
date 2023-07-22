import 'package:flutter/material.dart';
import 'package:tic_tac_toe/features/HomePage.dart';
import 'package:tic_tac_toe/ui/Theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.instance.theme,
      home: HomePage(),
    );
  }
}
