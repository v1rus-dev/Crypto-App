import 'dart:async';

import 'package:crypto_currency/repositories/crypto_compare/models/crypto_coin.dart';
import 'package:crypto_currency/utils/local_datasource.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CryptoAllListLocalDatasource extends LocalDatasource<CryptoCoin> {
  CryptoAllListLocalDatasource() : super(box: GetIt.I.get());

  Future<void> addList(List<CryptoCoin> list) async {
    final result = await box.addAll(list);
    debugPrint('add list size result: $result');
  }

  Future<List<CryptoCoin>> getList() async {
    var cryptoCoins = box.values;

    return Future(() => cryptoCoins.toList());
  }

  Future<List<CryptoCoin>> search(String search) async {
    var filteredCoins = box.values.where((c) =>
        c.name.toLowerCase().contains(search.toLowerCase()) ||
        c.coinName.toLowerCase().contains(search.toLowerCase()));
    return Future(() => filteredCoins.toList());
  }

  Future<void> resetList(List<CryptoCoin> list) async {
    await box.clear();
    await box.addAll(list);
  }

  databaseIsEmpty() => box.isEmpty;
}
