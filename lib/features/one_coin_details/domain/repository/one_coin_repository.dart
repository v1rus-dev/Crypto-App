import 'package:crypto_currency/data/api/crypto_compare_api.dart';
import 'package:crypto_currency/data/api/entities/history/coin_history_entity.dart';
import 'package:crypto_currency/data/api/entities/one_coin_info_entity.dart';
import 'package:crypto_currency/features/one_coin_details/domain/datasource/one_coin_local_datasource.dart';
import 'package:crypto_currency/features/one_coin_details/domain/datasource/one_coin_network_datasource.dart';

class OneCoinRepository {
  final OneCoinLocalDatasource localDatasource;
  final OneCoinNetworkDatasource networkDatasource;

  OneCoinRepository(
      {required this.localDatasource, required this.networkDatasource});

  Future<OneCoinInfoEntity?> load(String coinName) async =>
      networkDatasource.load(coinName);

  Future<List<CoinHistoryEntity>?> loadHistoryForMinute(String coinName) =>
      networkDatasource.loadHistory(coinName, TypeOfHistory.Minute);

  Future<List<CoinHistoryEntity>?> loadHistoryForHour(String coinName) =>
      networkDatasource.loadHistory(coinName, TypeOfHistory.Hour);

  Future<List<CoinHistoryEntity>?> loadHistoryForDay(String coinName) =>
      networkDatasource.loadHistory(coinName, TypeOfHistory.Day);
}
