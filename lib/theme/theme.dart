import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    primarySwatch: Colors.yellow,
    useMaterial3: false,
    listTileTheme: const ListTileThemeData(iconColor: Colors.black),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.yellow,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
    textTheme: const TextTheme(
        displayLarge: TextStyle(fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
        bodyMedium: TextStyle(fontSize: 14)));
