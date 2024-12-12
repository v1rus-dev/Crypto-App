import 'package:crypto_currency/data/api/dto/all_coins_info_dto.dart';
import 'package:crypto_currency/features/crypto_all_list/domain/datasources/crypto_all_list_local_datasource.dart';
import 'package:crypto_currency/features/crypto_all_list/domain/datasources/crypto_all_list_remote_datasource.dart';
import 'package:crypto_currency/data/database/dto/crypto_coin_local_dto.dart';

class CryptoAllListRepository {
  final CryptoAllListLocalDatasource _localDatasource;
  final CryptoAllListRemoteDatasource _remoteDatasource;

  CryptoAllListRepository(
      {required CryptoAllListLocalDatasource localDatasource,
      required CryptoAllListRemoteDatasource remoteDatasource})
      : _remoteDatasource = remoteDatasource,
        _localDatasource = localDatasource;

  Future<List<AllCoinsInfoDTO>> downloadCryptoCoinsList() async {
    final list = await _remoteDatasource.downloadAllList();
    return list;
  }

  Future<List<CryptoCoinLocalDTO>> getList() => _localDatasource.getList();

  Future<List<CryptoCoinLocalDTO>> search(String search) =>
      _localDatasource.search(search);

  Future<void> updateAllCryptoCoinsListFromNetwork(
      List<AllCoinsInfoDTO> list) async {
    final currentFavorites = await _localDatasource.getAllFavorites();
    final filteredList = list
        .map((entity) => CryptoCoinLocalDTO(
            name: entity.name,
            coinName: entity.coinName,
            algorithm: entity.algorithm,
            isTrading: entity.isTrading,
            isFavorite: currentFavorites
                .map((item) => item.name)
                .contains(entity.name)))
        .toList();
    return _localDatasource.resetList(filteredList);
  }

  Future<void> updateAllCryptoCoinsList(List<CryptoCoinLocalDTO> list) async {
    _localDatasource.resetList(list);
  }

  bool databaseIsEmpty() => _localDatasource.databaseIsEmpty();
}
