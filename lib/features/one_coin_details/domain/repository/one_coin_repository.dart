import 'package:crypto_currency/data/api/crypto_compare_api.dart';
import 'package:crypto_currency/data/api/dto/history/coin_history_dto.dart';
import 'package:crypto_currency/data/api/dto/one_coin_info_dto.dart';
import 'package:crypto_currency/features/one_coin_details/domain/datasource/one_coin_local_datasource.dart';
import 'package:crypto_currency/features/one_coin_details/domain/datasource/one_coin_network_datasource.dart';

class OneCoinRepository {
  final OneCoinLocalDatasource localDatasource;
  final OneCoinNetworkDatasource networkDatasource;

  OneCoinRepository(
      {required this.localDatasource, required this.networkDatasource});

  Future<OneCoinInfoDTO?> load(String coinName) async =>
      networkDatasource.load(coinName);

  Future<List<CoinHistoryDTO>?> loadHistoryForMinute(String coinName) =>
      networkDatasource.loadHistory(coinName, TypeOfHistory.Minute);

  Future<List<CoinHistoryDTO>?> loadHistoryForHour(String coinName) =>
      networkDatasource.loadHistory(coinName, TypeOfHistory.Hour);

  Future<List<CoinHistoryDTO>?> loadHistoryForDay(String coinName) =>
      networkDatasource.loadHistory(coinName, TypeOfHistory.Day);
}
