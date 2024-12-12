import 'package:crypto_currency/features/search_coin/domain/datasource/local_search_coins_datasource.dart';
import 'package:crypto_currency/data/database/dto/crypto_coin_local_dto.dart';

class SearchCoinRepository {
  final LocalSearchCoinsDatasource localCoinsDatasource;

  SearchCoinRepository({required this.localCoinsDatasource});

  Future<List<String>> getHints(String search) async => localCoinsDatasource.getHints(search, 5);

  Future<List<CryptoCoinLocalDTO>> getResult(String search) async => localCoinsDatasource.getResults(search.trim().toLowerCase());


}