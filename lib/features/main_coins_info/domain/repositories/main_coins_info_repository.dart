import 'package:crypto_currency/features/main_coins_info/domain/entities/coin_info.dart';

abstract class MainCoinsInfoRepository {
  Stream<List<CoinInfo>> observeFavoriteCoins();
}
