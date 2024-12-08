import 'package:crypto_currency/data/api/crypto_compare_api.dart';
import 'package:crypto_currency/data/api/entities/one_coin_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class OneCoinNetworkDatasource {
  final CryptoCompareApi _cryptoCompareApi = GetIt.I.get();

  Future<OneCoinInfoEntity?> load(String coinName) async {
    final response = await _cryptoCompareApi.getOneCoinInfo(coinName);
    
    return response;
  }
}
