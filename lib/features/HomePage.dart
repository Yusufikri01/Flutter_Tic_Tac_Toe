import 'package:flutter/material.dart';
import 'package:tic_tac_toe/features/Game.dart';
import 'package:tic_tac_toe/product/SpecialButton.dart';
import 'package:tic_tac_toe/ui/Color_schemes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ColorSchemes get _colorschemes => ColorSchemes.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "O - X",
              style: TextStyle(color: _colorschemes.white, fontSize: 64),
            ),
            SpecialButton(() {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Game()));
            }, "Oyuna Başla"),
          ],
        ),
      ),
    );
  }
}
