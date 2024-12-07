import 'package:crypto_currency/data/api/api.dart';
import 'package:crypto_currency/utils/env.dart';

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
}