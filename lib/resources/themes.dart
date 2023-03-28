import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        primaryColor: Colors.blue,
        colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.blue,
          secondary: Colors.lightBlueAccent[100],
          tertiary: Colors.blueGrey,
          surfaceTint: Colors.teal,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: Colors.grey,
        ),
      );
}
