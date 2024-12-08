import 'package:crypto_currency/data/api/api.dart';
import 'package:crypto_currency/data/api/entities/history/coin_history_entity.dart';
import 'package:crypto_currency/data/api/entities/one_coin_info_entity.dart';
import 'package:crypto_currency/utils/env.dart';
import 'package:flutter/material.dart';

class CryptoCompareApi extends Api {
  static const String baseUrl = "https://min-api.cryptocompare.com";
  static const String fullURL = "https://cryptocompare.com";
  final API_KEY = Env.cryptoCompareApiKey;

  Future<Map<String, dynamic>> getAllList() async {
    final response = await getClient().get('$baseUrl/data/all/coinlist');
    return response.data as Map<String, dynamic>;
  }

  Future<OneCoinInfoEntity?> getOneCoinInfo(String coinName) async {
    final response = await getClient().get('$baseUrl/data/pricemultifull',
        queryParameters: {'fsyms': coinName, 'tsyms': 'USD'});
    final rawData =
        (response.data as Map<String, dynamic>)['RAW'] as Map<String, dynamic>;
    final coinData = rawData[coinName] as Map<String, dynamic>;
    return OneCoinInfoEntity.fromJson(coinData['USD']);
  }

  Future<List<CoinHistoryEntity>?> getHistoryFor(
    String coinName,
    TypeOfHistory type,
  ) async {
    final response = await getClient().get(
        '$baseUrl/data/v2/${type.requestBody}',
        queryParameters: {'fsym': coinName, 'tsym': 'USD', 'limit': 10});
    final internalData =
        (response.data as Map<String, dynamic>)['Data'] as Map<String, dynamic>;
    final internalDataV2 = internalData['Data'] as List<dynamic>;
    debugPrint("Internal data V2: ${internalDataV2.toString()}");

    return Future(() {
      return internalDataV2.map((map) {
        return CoinHistoryEntity.fromJson(map as Map<String, dynamic>);
      }).toList();
    });
  }
}

enum TypeOfHistory {
  Minute(requestBody: 'histominute'),
  Hour(requestBody: 'histohour'),
  Day(requestBody: 'histoday');

  const TypeOfHistory({required this.requestBody});

  final String requestBody;
}
