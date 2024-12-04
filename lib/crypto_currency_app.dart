import 'package:flutter/material.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class CryptoCurrencyApp extends StatelessWidget {
  const CryptoCurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final platformBrightness = MediaQuery.of(context).platformBrightness;
    final isDark = platformBrightness == Brightness.dark;
    return MaterialApp(
      title: 'Crypto Currency App',
      theme: isDark ? darkTheme : lightTheme,
      routes: routes,
    );
  }
}