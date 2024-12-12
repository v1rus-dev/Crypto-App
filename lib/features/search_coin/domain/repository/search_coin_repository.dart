import 'package:crypto_currency/features/search_coin/domain/entities/entities.dart';

abstract class SearchCoinRepository {
  Future<List<String>> getHints(String search);

  Future<List<SearchCoin>> getResult(String search);
}
