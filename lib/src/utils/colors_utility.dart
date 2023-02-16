
import 'package:flutter/material.dart';

class ColorsUtility {
  // Avoid accidentally instantiated with implicit default constructor.
  ColorsUtility._();

  //static const royalBlueHex = 0xFF4169E1;
  static const yinmnBlueHex = 0xFF2E5090;
  static const darkRedHex = 0xFFD20F0F;
  static const redHex = 0xFFFF0000;
  static const darkPinkHex = 0xFFE22444;
  static const pinkHex = 0xFFFF4F6C;

  // Dark Theme (From Bright to Dark) :
  static const arsenicGreyHex = 0xFF424242; // Colors.grey.shade800
  static const arsenicDarkGreyHex = 0xFF303030; // Colors.grey[850]! or Canvas Dark
  // static const raisinBlackLightHex = 0xFF222222;
  static const raisinBlackHex = 0xFF151515;
  static const uiDarkHex = 0xFF0A0A0A;
  static const mainDarkHex = 0xFF000000;

  // Color Constant
  static const yinmnBlue = Color(yinmnBlueHex);
  static const darkRed = Color(darkRedHex);
  static const red = Color(redHex);
  static const darkPink = Color(darkPinkHex);
  static const pink = Color(pinkHex);

  static const arsenicGrey = Color(arsenicGreyHex);
  static const arsenicDarkGrey = Color(arsenicDarkGreyHex);
  static const raisinBlack = Color(raisinBlackHex);
  static const uiDark = Color(uiDarkHex);
  static const mainDark = Color(mainDarkHex);

  // Theme.of().canvasColor; 0xFF303030 (Default Canvas Color Dark Themed) or just Colors.grey[850]!.
  // static const canvasDark = Color(canvasDarkHex);

  static const MaterialColor royalBlue = MaterialColor(
    _royalBluePrimaryValue,
    <int, Color>{
      50: Color(0xFFA0B4F0),
      100: Color(0xFF8DA5ED),
      200: Color(0xFF7A96EA),
      300: Color(0xFF6787E7),
      400: Color(0xFF5478E4),
      500: Color(_royalBluePrimaryValue),
      600: Color(0xFF3B5FCB),
      700: Color(0xFF3454B4),
      800: Color(0xFF2E4A9E),
      900: Color(0xFF273F87),
    },
  );
  static const int _royalBluePrimaryValue = 0xFF4169E1;

  static const MaterialColor reddishFinch = MaterialColor(
    _reddishFinchPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9a9a),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(_reddishFinchPrimaryValue),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );
  static const int _reddishFinchPrimaryValue = 0xFFF44336;

  static const MaterialColor reddishFinchAccent = MaterialColor(
    _reddishFinchAccentValue,
    <int, Color>{
      100: Color(0xFFFF8A80),
      200: Color(_reddishFinchAccentValue),
      400: Color(0xFFFF1744),
      700: Color(0xFFD50000),
    },
  );
  static const int _reddishFinchAccentValue = 0xFFFF5252;

  static const MaterialColor vividCyan = MaterialColor(_vividCyanSecondaryValue, <int, Color>{
    50: Color(0xFFD8FAFC),
    100: Color(0xFF9BF1F7),
    200: Color(0xFF9BF3FA),
    300: Color(0xFF00DBEF),
    400: Color(0xFF00D2E9),
    500: Color(_vividCyanSecondaryValue),
    600: Color(0xFF30E4F3),
    700: Color(0xFF29E0F1),
    800: Color(0xFF22DDEF),
    900: Color(0xFF16D7EC),
  });
  static const int _vividCyanSecondaryValue = 0xFF00C8E5;

  static const MaterialColor vividCyanAccent = MaterialColor(_vividCyanAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_vividCyanAccentValue),
    400: Color(0xFFB6F7FF),
    700: Color(0xFF9CF4FF),
  });
  static const int _vividCyanAccentValue = 0xFFE9FDFF;

  static const MaterialColor indigoishFinch =
      MaterialColor(_indigoishFinchSecondaryValue, <int, Color>{
    50: Color(0xFFE8EAF6),
    100: Color(0xFFC5CAE9),
    200: Color(0xFF9FA8DA),
    300: Color(0xFF7986CB),
    400: Color(0xFF5C6BC0),
    500: Color(_indigoishFinchSecondaryValue),
    600: Color(0xFF3949AB),
    700: Color(0xFF303F9F),
    800: Color(0xFF283593),
    900: Color(0xFF1A237E),
  });
  static const int _indigoishFinchSecondaryValue = 0xFF3F51B5;

  static const MaterialColor indigoishFinchAccent =
      MaterialColor(_indigoishFinchAccentValue, <int, Color>{
    100: Color(0xFF8C9EFF),
    200: Color(_indigoishFinchAccentValue),
    400: Color(0xFF3D5AFE),
    700: Color(0xFF304FFe),
  });
  static const int _indigoishFinchAccentValue = 0xFF536DFE;
}
