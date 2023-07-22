import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/Extension.dart';

class ColorSchemes {
  static ColorSchemes? _instance;

  static ColorSchemes get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = ColorSchemes.init();
      return _instance!;
    }
  }

  ColorSchemes.init();

  static final Map<String, String> _colors = {
    'black': '111115',
    'orange': 'FFA500',
    'white': 'FFFFFF',
    'black45': '2D2D39',
    'PowderBlue': 'B6D0E2',
    'Glaucous': '6082B6',


  };

  Color get black => HexColor.fromHex(_colors['black']!);
  Color get orange => HexColor.fromHex(_colors['orange']!);
  Color get white => HexColor.fromHex(_colors['white']!);
  Color get black45 => HexColor.fromHex(_colors['black45']!);
  Color get PowderBlue => HexColor.fromHex(_colors['PowderBlue']!);
  Color get Glaucous => HexColor.fromHex(_colors['Glaucous']!);
}
