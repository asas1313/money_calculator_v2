import 'package:flutter/material.dart';

final _elevatedButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(25),
);

class Light {
  static final primaryColor = Colors.blue;
  static final accentColor = Colors.brown[300];
  static final onPrimary = Colors.blue;
  static final backgroundColor = Colors.white;
  static final cardColor = Colors.grey.withOpacity(.3);
}

class Dark {
  static final primaryColor = Colors.deepPurple[900];
  static final accentColor = Colors.brown[700];
  static final onPrimary = Colors.white;
  static final backgroundColor = Colors.black;
  static final cardColor = Colors.grey.withOpacity(.7);
}

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      primaryColor: Light.primaryColor,
      accentColor: Light.accentColor,
      backgroundColor: Light.backgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: _elevatedButtonShape,
          primary: Light.primaryColor,
          textStyle: TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      cardColor: Light.cardColor,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      primaryColor: Dark.primaryColor,
      accentColor: Dark.accentColor,
      backgroundColor: Dark.backgroundColor,
      textTheme: ThemeData.dark().textTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: _elevatedButtonShape,
          primary: Dark.primaryColor,
          textStyle: TextStyle(color: Dark.onPrimary),
        ),
      ),
      cardColor: Dark.cardColor,
    );
  }
}
