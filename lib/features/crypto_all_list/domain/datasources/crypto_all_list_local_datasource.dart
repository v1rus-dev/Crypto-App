import 'dart:async';

import 'package:crypto_currency/data/database/entities/crypto_coin.dart';
import 'package:crypto_currency/common/utils/local_datasource.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CryptoAllListLocalDatasource extends LocalDatasource<CryptoCoin> {
  CryptoAllListLocalDatasource() : super(dataBox: GetIt.I.get());

  Future<void> addList(List<CryptoCoin> list) async {
    final result = await dataBox.addAll(list);
    debugPrint('add list size result: $result');
  }

  Future<List<CryptoCoin>> getList() async {
    var cryptoCoins = dataBox.values;

    return Future(() => cryptoCoins.toList());
  }

  Future<List<CryptoCoin>> search(String search) async {
    var filteredCoins = dataBox.values.where((c) =>
        c.name.toLowerCase().contains(search.toLowerCase()) ||
        c.coinName.toLowerCase().contains(search.toLowerCase()));
    return Future(() => filteredCoins.toList());
  }

  Future<void> resetList(List<CryptoCoin> list) async {
    await dataBox.clear();
    await dataBox.addAll(list);
  }

  Future<List<CryptoCoin>> getAllFavorites() async {
    return dataBox.values.where((item) => item.isFavorite).toList();
  }

  databaseIsEmpty() => dataBox.isEmpty;
}
