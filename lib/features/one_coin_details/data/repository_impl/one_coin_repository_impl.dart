import 'package:crypto_currency/features/one_coin_details/data/datasources/datasources.dart';
import 'package:crypto_currency/features/one_coin_details/data/mappers/one_coin_info_mapper.dart';
import 'package:crypto_currency/features/one_coin_details/domain/entities/coin_base_info.dart';
import 'package:crypto_currency/features/one_coin_details/domain/entities/coin_history_info.dart';
import 'package:crypto_currency/features/one_coin_details/domain/entities/coin_local_info.dart';
import 'package:crypto_currency/features/one_coin_details/domain/repository/one_coin_repository.dart';

class OneCoinRepositoryImpl implements OneCoinRepository {

  final OneCoinLocalDatasource localDatasource = OneCoinLocalDatasource();
  final OneCoinNetworkDatasource networkDatasource = OneCoinNetworkDatasource();

  @override
  Future<CoinLocalInfo> getLocalInfo(String coinName) async {
    final data = await localDatasource.getCoinByName(coinName);
    return OneCoinInfoMapper.mapFromDatabase(data);
  }

  @override
  Future<CoinBaseInfo> load(String coinName) async {
    final response = await networkDatasource.loadCoinInfo(coinName);
    return OneCoinInfoMapper.mapBaseInfoFromNetwork(response);
  }

  @override
  Future<List<CoinHistoryInfo>> loadHistoryForDay(String coinName) {
    // TODO: implement loadHistoryForDay
    throw UnimplementedError();
  }

  @override
  Future<List<CoinHistoryInfo>> loadHistoryForHour(String coinName) {
    // TODO: implement loadHistoryForHour
    throw UnimplementedError();
  }

  @override
  Future<List<CoinHistoryInfo>> loadHistoryForMinute(String coinName) {
    // TODO: implement loadHistoryForMinute
    throw UnimplementedError();
  }

}