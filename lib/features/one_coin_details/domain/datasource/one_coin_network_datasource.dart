import 'package:crypto_currency/data/api/crypto_compare_api.dart';
import 'package:crypto_currency/data/api/dto/history/coin_history_dto.dart';
import 'package:crypto_currency/data/api/dto/one_coin_info_dto.dart';
import 'package:get_it/get_it.dart';

class OneCoinNetworkDatasource {
  final CryptoCompareApi _cryptoCompareApi = GetIt.I.get();

  Future<OneCoinInfoDTO?> load(String coinName) => _cryptoCompareApi.getOneCoinInfo(coinName);

  Future<List<CoinHistoryDTO>?> loadHistory(String coinName, TypeOfHistory type) => _cryptoCompareApi.getHistoryFor(coinName, type);
}
