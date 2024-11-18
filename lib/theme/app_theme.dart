import 'package:flutter/material.dart';

final appTheme = ThemeData(
  primarySwatch: Colors.red,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.red,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white), // Replacing bodyText1
    bodyMedium: TextStyle(color: Colors.grey), // Replacing bodyText2
  ),
);
