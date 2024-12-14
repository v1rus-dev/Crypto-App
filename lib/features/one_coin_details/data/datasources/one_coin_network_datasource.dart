import 'package:crypto_currency/data/api/crypto_compare_api.dart';
import 'package:crypto_currency/data/api/dto/history/coin_history_dto.dart';
import 'package:crypto_currency/data/api/dto/one_coin_info_dto.dart';
import 'package:get_it/get_it.dart';

class OneCoinNetworkDatasource {
  CryptoCompareApi api = GetIt.I.get();

  Future<OneCoinInfoDTO> loadCoinInfo(String coinName) async => api.getOneCoinInfo(coinName);

  Future<List<CoinHistoryDTO>?> getHistoryForAMinute(String coinName) async => api.getHistoryFor(coinName, TypeOfHistory.Minute);

  Future<List<CoinHistoryDTO>?> getHistoryForAnHourt(String coinName) async => api.getHistoryFor(coinName, TypeOfHistory.Hour);

  Future<List<CoinHistoryDTO>?> getHistoryForADay(String coinName) async => api.getHistoryFor(coinName, TypeOfHistory.Day);
}