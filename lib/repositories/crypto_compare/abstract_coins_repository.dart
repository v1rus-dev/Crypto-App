import 'models/crypto_coin.dart';

abstract class AbstractCryptoCompareRepository {
  Future<List<CryptoCoin>> getCoinsList();
}