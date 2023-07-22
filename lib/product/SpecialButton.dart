import 'package:flutter/material.dart';

class SpecialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  SpecialButton(this.onPressed, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Container(
          width: 200,
          height: 40,
          child: ElevatedButton(
              onPressed: onPressed,
              child: Text(
                text,
                style: TextStyle(fontSize: 20),
              ))),
    );
  }
}
