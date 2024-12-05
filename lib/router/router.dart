import 'package:crypto_currency/features/home/view/home_screen.dart';

import '../features/one_coin_details/one_coin_details.dart';

final routes = {
  '/': (context) => const HomeScreen(),
  '/coin': (context) => const OneCoinDetailScreen()
};
