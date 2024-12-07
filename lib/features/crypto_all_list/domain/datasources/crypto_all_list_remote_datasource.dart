import 'dart:convert';

import 'package:crypto_currency/data/api/crypto_compare_api.dart';
import 'package:crypto_currency/data/api/entities/all_coins_info_entity.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class CryptoAllListRemoteDatasource {
  final CryptoCompareApi _cryptoCompareApi = GetIt.I.get();

  Future<List<AllCoinsInfoEntity>> downloadAllList() async {
    final response = await _cryptoCompareApi.getAllList();
    final data = response['Data'] as Map<String, dynamic>;
    List<AllCoinsInfoEntity> result = await _filterByAvailableIcons(data);

    return Future(() => result);
  }

  Future<List<AllCoinsInfoEntity>> _filterByAvailableIcons(
      Map<String, dynamic> map) async {
    final String jsonString =
        await rootBundle.loadString('assets/mapping/crypto_mapping.json');
    final Map<String, dynamic> mapping = json.decode(jsonString);
    List<AllCoinsInfoEntity> result = [];
    map.values.forEach((value) {
      final _data = AllCoinsInfoEntity.fromJson(value as Map<String, dynamic>);
      if (mapping.containsKey(_data.name)) {
        result.add(_data);
      }
    });
    return Future(() => result);
  }
}
