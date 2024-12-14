import 'package:crypto_currency/data/database/database.dart';
import 'package:crypto_currency/data/database/dto/crypto_coin_local_dto.dart';

class AllCoinsLocalDatasource {
  Database<CryptoCoinLocalDTO> database = Database();

  Future<Iterable<CryptoCoinLocalDTO>> getAllList() async =>
      database.box.values;

  bool isEmpty() => database.isEmpty;

  Future<List<CryptoCoinLocalDTO>> getFavoriteCoins() async =>
      database.box.values.where((item) => item.isFavorite).toList();

  Future<void> updateAllCoins(Iterable<CryptoCoinLocalDTO> list) async {
    await database.box.clear();
    await database.box.addAll(list);
  }
}
