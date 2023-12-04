import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
  const MaterialColor seedColor = Colors.blue;

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      listTileTheme: const ListTileThemeData(
        iconColor: seedColor,
      ),
    );
  }
}