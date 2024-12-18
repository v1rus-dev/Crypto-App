import 'package:crypto_currency/data/api/crypto_compare_api.dart';
import 'package:crypto_currency/data/api/dto/coin_price_dto.dart';

class ConverterNetworkDatasource {
  final CryptoCompareApi api;

  const ConverterNetworkDatasource({required this.api});

  Future<List<CoinPriceDto>> fetchPrices(List<String> coinNames) =>
      api.featchMultipleSymbolsPrice(coinNames);
}
