import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get dark => ThemeData(
        colorScheme: const ColorScheme.dark(),
        primaryColor: Colors.red,
      );

  static ThemeData get light => ThemeData(
        colorScheme: const ColorScheme.light(),
        primaryColor: Colors.purple,
      );
}
