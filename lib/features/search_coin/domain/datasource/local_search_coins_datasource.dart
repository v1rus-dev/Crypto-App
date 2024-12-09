import 'package:crypto_currency/repositories/crypto_compare/models/crypto_coin.dart';
import 'package:crypto_currency/utils/local_datasource.dart';
import 'package:get_it/get_it.dart';

class LocalSearchCoinsDatasource extends LocalDatasource<CryptoCoin> {
  LocalSearchCoinsDatasource() : super(box: GetIt.I.get());

  Future<List<String>> getHints(String search, int maxCount) async {
    final coinNameCompareValues = box.values
        .where((coin) =>
            coin.coinName.toLowerCase().startsWith(search.trim().toLowerCase()))
        .getHints(maxCount, (item) => item.coinName);
    final nameCompareValues = box.values
        .where((coin) =>
            coin.name.toLowerCase().startsWith(search.trim().toLowerCase()))
        .getHints(maxCount, (item) => item.name);
    final result = [...coinNameCompareValues, ...nameCompareValues];
    result.sort((a, b) => a.length.compareTo(b.length));
    return result.take(maxCount).toList();
  }

  Future<List<CryptoCoin>> getResults(String search) async {
    return box.values
        .where((coin) =>
            coin.coinName.toLowerCase().startsWith(search) ||
            coin.name.toLowerCase().startsWith(search))
        .toList();
  }
}

extension HintExt on Iterable<CryptoCoin> {
  List<String> getHints(int maxCount, String Function(CryptoCoin) map) =>
      toList().take(maxCount * 2).map(map).toList();
}
