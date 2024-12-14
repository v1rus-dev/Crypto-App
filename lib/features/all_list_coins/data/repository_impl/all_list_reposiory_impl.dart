import 'dart:convert';

import 'package:crypto_currency/data/api/dto/dto.dart';
import 'package:crypto_currency/data/database/dto/crypto_coin_local_dto.dart';
import 'package:crypto_currency/features/all_list_coins/data/datasources/datasources.dart';
import 'package:crypto_currency/features/all_list_coins/data/mappers/coin_entity_mapper.dart';
import 'package:crypto_currency/features/all_list_coins/domain/entities/coin_entity.dart';
import 'package:crypto_currency/features/all_list_coins/domain/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  bool databaseIsEmpty() => localDatasource.isEmpty();

  @override
  Future<void> loadCoins() async {
    final models = await remoteDatasource.loadAllCoins();
    debugPrint('Models: ${models.toString()}');
    final filteredModels = await _filterByAvailableIcons(models);
    return _updateDatabase(
        filteredModels.map(CoinEntityMapper.fromNetworkToLocal));
  }

  Future<void> _updateDatabase(Iterable<CryptoCoinLocalDTO> list) async {
    final favoriteCoins = await localDatasource.getFavoriteCoins();
    final result = <CryptoCoinLocalDTO>[];
    for (var item in list) {
      if (favoriteCoins.map((item) => item.name).contains(item.name)) {
        result.add(item.copyWith(isFavorite: true));
      } else {
        result.add(item);
      }
    }
    return localDatasource.updateAllCoins(result);
  }

  Future<List<AllCoinsInfoDTO>> _filterByAvailableIcons(
      Iterable<AllCoinsInfoDTO> list) async {
    final String jsonString =
        await rootBundle.loadString('assets/mapping/crypto_mapping.json');
    final Map<String, dynamic> mapping = json.decode(jsonString);
    List<AllCoinsInfoDTO> result = [];
    for (var value in list) {
      if (mapping.containsKey(value.name)) {
        result.add(value);
      }
    }
    return result;
  }
}
