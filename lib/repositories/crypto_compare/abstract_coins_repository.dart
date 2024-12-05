import 'models/crypto_coin.dart';

abstract class AbstractCryptoCompareRepository {
  Future<List<CryptoCoin>> getSelectedCoinsList(List<String> coins);

  Future<List<CryptoCoin>> getAllCoins();
}