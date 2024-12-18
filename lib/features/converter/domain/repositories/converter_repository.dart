import 'package:crypto_currency/features/converter/domain/entities/coin_price.dart';

abstract class ConverterRepository {
  Future<List<CoinPrice>> fetchPrices(List<String> coinNames);
}
