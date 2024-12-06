import 'dart:convert';

import 'package:crypto_currency/repositories/crypto_compare/models/coin_info.dart';
import 'package:crypto_currency/repositories/crypto_compare/models/coin_info_wrapper.dart';
import 'package:crypto_currency/utils/env.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'crypto_compare.dart';

class CryptoCompareRepository implements AbstractCryptoCompareRepository {
  const CryptoCompareRepository({required this.dio});

  final Dio dio;

  final String baseUrl = "https://min-api.cryptocompare.com";
  final String fullURL = "https://cryptocompare.com";

  @override
  Future<List<CryptoCoin>> getSelectedCoinsList(List<String> coins) async {
    final fsyms = coins.join(',');
    final response = await dio.get('$baseUrl/data/pricemultifull',
        queryParameters: {'fsyms': fsyms, 'tsyms': 'USD,EUR,BEL,RUB'});

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];
      final changePctDay = usdData['CHANGEPCTDAY'];
      return CryptoCoin(
          name: e.key,
          priceInUSD: price,
          imageUrl: '$fullURL/$imageUrl',
          changePrcDay: changePctDay);
    }).toList();
    return cryptoCoinsList;
  }

  @override
  Future<List<CryptoSimplePrice>> getSimpleCoinPrice(String coinName) async {
    // TODO: implement getSimpleCoinDetail
    final response = await dio.get('$baseUrl/data/price',
        queryParameters: {'fsym': coinName, 'tsyms': 'USD,EUR,BEL,RUB'});
    final data = response.data as Map<String, dynamic>;

    debugPrint("Data: $data");

    final list = <CryptoSimplePrice>[];
    // data.forEach((key, value) {
    //   debugPrint("Value: $value");
    //   list.add(CryptoSimplePrice(name: key, price: value));
    // });

    return list;
  }

  @override
  Future<CoinInfo?> getCoinInfo(String coinName) async {
    const API_KEY = Env.cryptoCompareApiKey;
    Response response = await dio
        .get('$baseUrl/data/all/coinlist', queryParameters: {'fsym': coinName});
    Map<String, dynamic> dataMap = response.data as Map<String, dynamic>;

    final coinInfoWrapper = CoinInfoWrapper.fromJson(dataMap);
    debugPrint("CoinInfo ${coinInfoWrapper.data[coinName]}");

    return coinInfoWrapper.data[coinName];
  }

  @override
  Future<List<CryptoCoin>> getAllCoins() async {
    const API_KEY = Env.cryptoCompareApiKey;
    final response = await dio.get('$baseUrl/data/all/coinlist',
        queryParameters: {"apiKey": API_KEY});
    final data = response.data as Map<String, dynamic>;
    final dataMap = data['Data'] as Map<String, dynamic>;
    debugPrint(dataMap['BTC'].toString());
    return Future.value([]);
  }
}
