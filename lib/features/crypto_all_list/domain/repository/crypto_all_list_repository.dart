import 'package:crypto_currency/data/api/entities/all_coins_info_entity.dart';
import 'package:crypto_currency/features/crypto_all_list/domain/datasources/crypto_all_list_local_datasource.dart';
import 'package:crypto_currency/features/crypto_all_list/domain/datasources/crypto_all_list_remote_datasource.dart';
import 'package:crypto_currency/repositories/crypto_compare/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CryptoAllListRepository {
  final CryptoAllListLocalDatasource _localDatasource;
  final CryptoAllListRemoteDatasource _remoteDatasource;

  CryptoAllListRepository(
      {required CryptoAllListLocalDatasource localDatasource,
      required CryptoAllListRemoteDatasource remoteDatasource})
      : _remoteDatasource = remoteDatasource,
        _localDatasource = localDatasource;

  Future<List<CryptoCoin>> downloadCryptoCoinsList() async {
    final list = await _remoteDatasource.downloadAllList();
    return Future(() {
      return list
          .map((entity) => CryptoCoin(
              name: entity.name,
              coinName: entity.coinName,
              algorithm: entity.algorithm,
              isTrading: entity.isTrading,
              imageUrl: '',
              changePrcDay: 16))
          .toList();
    });
  }

  Future<List<CryptoCoin>> getList() => _localDatasource.getList();

  Future<List<CryptoCoin>> search(String search) =>
      _localDatasource.search(search);

  Future<void> updateAllCryptoCoinsList(List<CryptoCoin> list) async {
    _localDatasource.resetList(list);
  }

  bool databaseIsEmpty() => _localDatasource.databaseIsEmpty();
}
