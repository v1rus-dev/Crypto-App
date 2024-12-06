import 'package:crypto_currency/repositories/crypto_compare/models/coin_info.dart';
import 'package:crypto_currency/repositories/crypto_compare/models/models.dart';

abstract class AbstractCryptoCompareRepository {
  Future<List<CryptoCoin>> getSelectedCoinsList(List<String> coins);

  Future<List<CryptoSimplePrice>> getSimpleCoinPrice(String coinName);

  Future<CoinInfo?> getCoinInfo(String coinName);

  Future<List<CryptoCoin>> getAllCoins();
}