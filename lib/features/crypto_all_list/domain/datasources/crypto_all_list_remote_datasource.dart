import 'dart:convert';

import 'package:crypto_currency/data/api/crypto_compare_api.dart';
import 'package:crypto_currency/data/api/dto/all_coins_info_dto.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class CryptoAllListRemoteDatasource {
  final CryptoCompareApi _cryptoCompareApi = GetIt.I.get();

  Future<List<AllCoinsInfoDTO>> downloadAllList() async {
    final response = await _cryptoCompareApi.getAllList();
    List<AllCoinsInfoDTO> result = await _filterByAvailableIcons(response);

    return Future(() => result);
  }

  Future<List<AllCoinsInfoDTO>> _filterByAvailableIcons(
      Iterable<AllCoinsInfoDTO> list) async {
    final String jsonString =
        await rootBundle.loadString('assets/mapping/crypto_mapping.json');
    final Map<String, dynamic> mapping = json.decode(jsonString);
    List<AllCoinsInfoDTO> result = [];
    list.forEach((value) {
      if (mapping.containsKey(value.name)) {
        result.add(value);
      }
    });
    return Future(() => result);
  }
}
