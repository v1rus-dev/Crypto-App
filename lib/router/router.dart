import 'package:crypto_currency/features/home/view/home_screen.dart';

import '../features/crypto_coin/crypto_coin.dart';

final routes = {
  '/': (context) => const HomeScreen(),
  '/coin': (context) => const CryptoCoinScreen()
};
