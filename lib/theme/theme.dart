import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    useMaterial3: false,
    listTileTheme: const ListTileThemeData(iconColor: Colors.black),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        elevation: 0),
    textTheme: const TextTheme(
        displayLarge: TextStyle(fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
        bodyMedium: TextStyle(fontSize: 14),
        bodySmall: TextStyle(fontSize: 12),
        bodyLarge: TextStyle(fontSize: 18)));

final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    useMaterial3: false,
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
    scaffoldBackgroundColor: Colors.grey[800],
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.grey,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        elevation: 0),
    textTheme: const TextTheme(
        displayLarge: TextStyle(fontWeight: FontWeight.bold),
        titleMedium: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 21, color: Colors.white),
        bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
        bodyLarge: TextStyle(fontSize: 18, color: Colors.white)),
        cardTheme: const CardTheme(color: Colors.grey));
