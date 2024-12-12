import 'package:crypto_currency/data/database/dto/crypto_coin_local_dto.dart';
import 'package:crypto_currency/common/utils/local_datasource.dart';
import 'package:get_it/get_it.dart';

class LocalSearchCoinsDatasource extends LocalDatasource<CryptoCoinLocalDTO> {
  LocalSearchCoinsDatasource() : super(dataBox: GetIt.I.get());

  Future<List<String>> getHints(String search, int maxCount) async {
    // final coinNameCompareValues = dataBox.values
    //     .where((coin) =>
    //         coin.coinName.toLowerCase().startsWith(search.trim().toLowerCase()))
    //     .getHints(maxCount, (item) => item.coinName);
    // final nameCompareValues = dataBox.values
    //     .where((coin) =>
    //         coin.name.toLowerCase().startsWith(search.trim().toLowerCase()))
    //     .getHints(maxCount, (item) => item.name);
    // final result = [...coinNameCompareValues, ...nameCompareValues];
    // result.sort((a, b) => a.length.compareTo(b.length));
    return [];
  }

  Future<List<CryptoCoinLocalDTO>> getResults(String search) async {
    return dataBox.values
        .where((coin) =>
            coin.coinName.toLowerCase().startsWith(search) ||
            coin.name.toLowerCase().startsWith(search))
        .toList();
  }
}