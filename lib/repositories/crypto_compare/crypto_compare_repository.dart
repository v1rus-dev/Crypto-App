import 'package:dio/dio.dart';

import 'crypto_compare.dart';

class CryptoCompareRepository implements AbstractCryptoCompareRepository {

  const CryptoCompareRepository({required this.dio});

  final Dio dio;

  final String baseUrl = "https://min-api.cryptocompare.com";
  final String fullURL = "https://cryptocompare.com";

  @override
  Future<List<CryptoCoin>> getSelectedCoinsList(List<String> coins) async {
    final fsyms = coins.join(',');
    final response = await dio
        .get('$baseUrl/data/pricemultifull', queryParameters: {
          'fsyms': fsyms,
          'tsyms': 'USD,EUR,BEL,RUB'
        });

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries
    .map((e) {
      final usdData = (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];
      final changePctDay = usdData['CHANGEPCTDAY'];
      return CryptoCoin(name: e.key, priceInUSD: price, imageUrl: '$fullURL/$imageUrl', changePrcDay: changePctDay);
    }).toList();
    return cryptoCoinsList;
  }
}
