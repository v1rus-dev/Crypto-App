import 'package:crypto_currency/data/database/dto/crypto_coin_local_dto.dart';
import 'package:crypto_currency/features/all_list_coins/data/datasources/datasources.dart';
import 'package:crypto_currency/features/all_list_coins/data/mappers/coin_entity_mapper.dart';
import 'package:crypto_currency/features/all_list_coins/domain/entities/coin_entity.dart';
import 'package:crypto_currency/features/all_list_coins/domain/repository/repository.dart';

class AllListReposioryImpl implements AllListRepository {
  final AllCoinsRemoteDatasource remoteDatasource;
  final AllCoinsLocalDatasource localDatasource;

  const AllListReposioryImpl(
      {required this.localDatasource, required this.remoteDatasource});

  @override
  Future<List<CoinEntity>> getAllList() async {
    final models = await localDatasource.getAllList();
    final mappedList = models.map(CoinEntityMapper.fromDTO).toList();
    return mappedList;
  }

  @override
  Future<void> loadCoins() async {
    final models = await remoteDatasource.loadAllCoins();
    return _updateDatabase(
        models.map(CoinEntityMapper.fromNetworkToLocal));
  }

  Future<void> _updateDatabase(Iterable<CryptoCoinLocalDTO> list) async {
    return localDatasource.updateAllCoins(list);
  }
}
