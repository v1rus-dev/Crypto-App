import 'package:flutter/material.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class CryptoCurrencyApp extends StatelessWidget {
  const CryptoCurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Currency App',
      theme: lightTheme,
      routes: routes,
    );
  }
}
