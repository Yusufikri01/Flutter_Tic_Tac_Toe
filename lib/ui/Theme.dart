import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/Color_schemes.dart';

class AppTheme {
  ColorSchemes get _colorschemes => ColorSchemes.instance;

  static AppTheme? _instance;
  static AppTheme get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = AppTheme.init();
      return _instance!;
    }
  }

  AppTheme.init();

  ThemeData get theme => ThemeData(
        // arka plan rengi
        scaffoldBackgroundColor: _colorschemes.PowderBlue,
        elevatedButtonTheme: _elevatedButtonTheme,

      );

  ElevatedButtonThemeData get _elevatedButtonTheme =>
      ElevatedButtonThemeData(style: _buttonStyle);

  ButtonStyle get _buttonStyle => ButtonStyle(
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)))),
        // ELEVATED BUTTON RENGİ GELMEZSE BU RENK DEVREYE GİRER
        backgroundColor: MaterialStateProperty.all(_colorschemes.black45),
        // TIKLAYINCA RENGİ DEGİŞİYOR
        overlayColor: MaterialStateProperty.all(_colorschemes.orange),
        minimumSize: MaterialStateProperty.all(
          const Size(80, 40),
        ),
      );
}
