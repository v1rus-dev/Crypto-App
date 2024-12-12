import 'dart:async';

import 'package:crypto_currency/data/database/dto/crypto_coin_local_dto.dart';
import 'package:crypto_currency/common/utils/local_datasource.dart';
import 'package:get_it/get_it.dart';

class CryptoAllListLocalDatasource extends LocalDatasource<CryptoCoinLocalDTO> {
  CryptoAllListLocalDatasource() : super(dataBox: GetIt.I.get());

  Future<void> addList(List<CryptoCoinLocalDTO> list) async {
    final result = await dataBox.addAll(list);
  }

  Future<List<CryptoCoinLocalDTO>> getList() async {
    var cryptoCoins = dataBox.values;

    return Future(() => cryptoCoins.toList());
  }

  Future<List<CryptoCoinLocalDTO>> search(String search) async {
    var filteredCoins = dataBox.values.where((c) =>
        c.name.toLowerCase().contains(search.toLowerCase()) ||
        c.coinName.toLowerCase().contains(search.toLowerCase()));
    return Future(() => filteredCoins.toList());
  }

  Future<void> resetList(List<CryptoCoinLocalDTO> list) async {
    await dataBox.clear();
    await dataBox.addAll(list);
  }

  Future<List<CryptoCoinLocalDTO>> getAllFavorites() async {
    return dataBox.values.where((item) => item.isFavorite).toList();
  }

  databaseIsEmpty() => dataBox.isEmpty;
}
