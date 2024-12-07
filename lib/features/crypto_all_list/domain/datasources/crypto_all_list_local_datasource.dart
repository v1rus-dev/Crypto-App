import 'dart:async';

import 'package:crypto_currency/repositories/crypto_compare/crypto_compare.dart';
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

    if (cryptoCoins == null || cryptoCoins == [] || cryptoCoins.isEmpty) {
      cryptoCoins = [];
    }
    return Future(() => cryptoCoins.toList());
  }

  Future<void> resetList(List<CryptoCoin> list) async {
    await box.clear();
    await box.addAll(list);
  }

  databaseIsEmpty() => box.isEmpty;
}
