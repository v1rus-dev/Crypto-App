import 'package:crypto_currency/data/api/api.dart';
import 'package:crypto_currency/data/api/entities/one_coin_info_entity.dart';
import 'package:crypto_currency/utils/env.dart';
import 'package:flutter/material.dart';

class CryptoCompareApi extends Api {

  static const String baseUrl = "https://min-api.cryptocompare.com";
  static const String fullURL = "https://cryptocompare.com";
  final API_KEY = Env.cryptoCompareApiKey;

  Future<Map<String, dynamic>> getAllList() async {
    final response = await getClient().get('$baseUrl/data/all/coinlist', queryParameters: {
      'apiKey': API_KEY
    });
    return response.data as Map<String, dynamic>;
  }

  Future<OneCoinInfoEntity?> getOneCoinInfo(String coinName) async {
    final response = await getClient().get('$baseUrl/data/pricemultifull', queryParameters: {
      'apiKey' : API_KEY,
      'fsyms': coinName,
      'tsyms': 'USD'
    });
    final rawData = (response.data as Map<String, dynamic>)['RAW'] as Map<String, dynamic>;
    final coinData = rawData[coinName] as Map<String, dynamic>;
    return OneCoinInfoEntity.fromJson(coinData['USD']);
  }
}