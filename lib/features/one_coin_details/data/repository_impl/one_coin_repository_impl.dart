import 'package:crypto_currency/common/utils/future_ext.dart';
import 'package:crypto_currency/common/utils/future_list_ext.dart';
import 'package:crypto_currency/data/api/dto/dto.dart';
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
  Future<Iterable<CoinHistoryInfo>> loadHistoryForDay(String coinName) async =>
      networkDatasource
          .getHistoryForADay(coinName)
          .mapNullableList(OneCoinInfoMapper.mapHistoryFromNetwork);

  @override
  Future<Iterable<CoinHistoryInfo>> loadHistoryForHour(String coinName) async =>
      networkDatasource
          .getHistoryForAnHourt(coinName)
          .mapNullableList(OneCoinInfoMapper.mapHistoryFromNetwork);

  @override
  Future<Iterable<CoinHistoryInfo>> loadHistoryForMinute(String coinName) async =>
      networkDatasource
          .getHistoryForAMinute(coinName)
          .mapNullableList(OneCoinInfoMapper.mapHistoryFromNetwork);
}
