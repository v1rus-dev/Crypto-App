import 'package:crypto_currency/data/api/dto/all_coins_info_dto.dart';
import 'package:crypto_currency/data/api/dio_service.dart';
import 'package:crypto_currency/data/api/dto/coin_price_dto.dart';
import 'package:crypto_currency/data/api/dto/history/coin_history_dto.dart';
import 'package:crypto_currency/data/api/dto/one_coin_info_dto.dart';
import 'package:crypto_currency/utils/env.dart';
import 'package:flutter/foundation.dart';

class CryptoCompareApi {
  static const String baseUrl = "https://min-api.cryptocompare.com";
  static const String fullURL = "https://cryptocompare.com";
  final API_KEY = Env.cryptoCompareApiKey;

  final DioService dioService;

  const CryptoCompareApi({required this.dioService});

  Future<Iterable<AllCoinsInfoDTO>> getAllList() async {
    final response = await dioService.client.get(
      '$baseUrl/data/all/coinlist',
    );
    final data = response.data['Data'] as Map<String, dynamic>;
    List<AllCoinsInfoDTO> result = [];

    data.values.forEach((value) {
      result.add(AllCoinsInfoDTO.fromJson(value));
    });

    return result;
  }

  Future<OneCoinInfoDTO> getOneCoinInfo(String coinName) async {
    final response = await dioService.client.get(
      '$baseUrl/data/pricemultifull',
      queryParameters: {'fsyms': coinName, 'tsyms': 'USD'},
    );
    final rawData =
        (response.data as Map<String, dynamic>)['RAW'] as Map<String, dynamic>;
    final coinData = rawData[coinName] as Map<String, dynamic>;
    return OneCoinInfoDTO.fromJson(coinData['USD']);
  }

  Future<List<CoinPriceDto>> featchMultipleSymbolsPrice(
      List<String> coinNames) async {
    final response = await dioService.client.get('$baseUrl/data/pricemulti',
        queryParameters: {'fsyms': coinNames.join(','), 'tsyms': 'USD'});
    final result = <CoinPriceDto>[];

    final data = response.data as Map<String, dynamic>;

    data.forEach((value, dataInfo) {
      final internalData = dataInfo as Map<String, dynamic>;
      debugPrint("Internal data: ${internalData}");
      result
          .add(CoinPriceDto(coinName: value, price: internalData['USD'] ?? 0));
    });

    return result;
  }

  Future<List<CoinHistoryDTO>?> getHistoryFor(
    String coinName,
    TypeOfHistory type,
  ) async {
    final response = await dioService.client.get(
      '$baseUrl/data/v2/${type.requestBody}',
      queryParameters: {'fsym': coinName, 'tsym': 'USD', 'limit': 10},
    );
    final internalData =
        (response.data as Map<String, dynamic>)['Data'] as Map<String, dynamic>;
    final internalDataV2 = internalData['Data'] as List<dynamic>;

    return Future(() {
      return internalDataV2.map((map) {
        return CoinHistoryDTO.fromJson(map as Map<String, dynamic>);
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
