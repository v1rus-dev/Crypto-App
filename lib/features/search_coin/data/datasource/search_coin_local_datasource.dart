import 'package:crypto_currency/data/database/database.dart';
import 'package:crypto_currency/data/database/dto/crypto_coin_local_dto.dart';

class SearchCoinLocalDatasource {
  Database<CryptoCoinLocalDTO> database = Database();

  Future<List<String>> getHints(String search, int maxCount) async {
    final coinNameCompareValues = database.box.values
        .where((coin) =>
            coin.coinName.toLowerCase().startsWith(search.trim().toLowerCase()))
        .getHints(maxCount, (item) => item.coinName);
    final nameCompareValues = database.box.values
        .where((coin) =>
            coin.name.toLowerCase().startsWith(search.trim().toLowerCase()))
        .getHints(maxCount, (item) => item.name);
    final result = [...coinNameCompareValues, ...nameCompareValues];
    result.sort((a, b) => a.length.compareTo(b.length));
    return result;
  }

  Future<Iterable<CryptoCoinLocalDTO>> findCoins(String search) async =>
      database.box.values
          .where((coin) =>
              coin.coinName.toLowerCase().startsWith(search) ||
              coin.name.toLowerCase().startsWith(search));
}

extension HintExt on Iterable<CryptoCoinLocalDTO> {
  List<String> getHints(
          int maxCount, String Function(CryptoCoinLocalDTO) map) =>
      toList().take(maxCount * 2).map(map).toList();
}
