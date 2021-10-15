import 'package:flutter/material.dart';

final _elevatedButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(25),
);

class Light {
  static final primaryColor = Colors.blue;
  static final accentColor = Colors.brown[300];
  static final scaffoldBackgroundColor = Colors.white70;
}

class Dark {
  static final primaryColor = Colors.deepPurple[700];
  static final accentColor = Colors.brown[700];
  static final scaffoldBackgroundColor = Colors.black54;
}

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      primaryColor: Light.primaryColor,
      accentColor: Light.accentColor,
      colorScheme: ColorScheme.light(),
      scaffoldBackgroundColor: Light.scaffoldBackgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: _elevatedButtonShape,
          primary: Light.primaryColor,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      primaryColor: Dark.primaryColor,
      accentColor: Dark.accentColor,
      textTheme: ThemeData.dark().textTheme,
      colorScheme: ColorScheme.dark(),
      scaffoldBackgroundColor: Dark.scaffoldBackgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: _elevatedButtonShape,
          primary: Dark.primaryColor,
        ),
      ),
    );
  }
}
