import 'package:crypto_currency/repositories/crypto_compare/models/coin_full_data.dart';
import 'package:crypto_currency/repositories/crypto_compare/models/coin_info.dart';
import 'package:crypto_currency/repositories/crypto_compare/models/models.dart';

abstract interface class AbstractCryptoCompareRepository {
  Future<List<CryptoCoin>> getSelectedCoinsList(List<String> coins);

  Future<List<CryptoSimplePrice>> getSimpleCoinPrice(String coinName);

  Future<List<CoinFullData>> getCoinFullData(String coinName);

  Future<CoinInfo?> getCoinInfo(String coinName);

  Future<List<CryptoCoin>> getAllCoins();
}