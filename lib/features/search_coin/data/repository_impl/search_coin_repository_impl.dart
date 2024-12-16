import 'package:crypto_currency/features/search_coin/data/datasource/datasource.dart';
import 'package:crypto_currency/features/search_coin/data/mappers/search_mapper.dart';
import 'package:crypto_currency/features/search_coin/domain/entities/search_coin.dart';
import 'package:crypto_currency/features/search_coin/domain/repository/search_coin_repository.dart';

class SearchCoinRepositoryImpl implements SearchCoinRepository {
  final SearchCoinLocalDatasource datasource;

  SearchCoinRepositoryImpl({required this.datasource});

  @override
  Future<List<String>> getHints(String search) =>
      datasource.getHints(search, 5);

  @override
  Future<List<SearchCoin>> getResult(String search) async {
    final searchedList = await datasource.findCoins(search.toLowerCase());
    return searchedList.map(SearchMapper.mapFromDatabase).toList();
  }
}
