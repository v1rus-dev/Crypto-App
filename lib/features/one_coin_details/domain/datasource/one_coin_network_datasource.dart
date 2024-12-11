import 'package:crypto_currency/data/api/crypto_compare_api.dart';
import 'package:crypto_currency/data/api/entities/history/coin_history_entity.dart';
import 'package:crypto_currency/data/api/entities/one_coin_info_entity.dart';
import 'package:get_it/get_it.dart';

class OneCoinNetworkDatasource {
  final CryptoCompareApi _cryptoCompareApi = GetIt.I.get();

  Future<OneCoinInfoEntity?> load(String coinName) => _cryptoCompareApi.getOneCoinInfo(coinName);

  Future<List<CoinHistoryEntity>?> loadHistory(String coinName, TypeOfHistory type) => _cryptoCompareApi.getHistoryFor(coinName, type);
}
