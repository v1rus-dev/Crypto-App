import 'package:crypto_currency/data/database/database.dart';
import 'package:crypto_currency/data/database/dto/crypto_coin_local_dto.dart';

class AllCoinsLocalDatasource {
  Database<CryptoCoinLocalDTO> database = Database();

  Future<Iterable<CryptoCoinLocalDTO>> getAllList() async =>
      database.box.values;

  Future<void> updateAllCoins(Iterable<CryptoCoinLocalDTO> list) async {
    await database.box.clear();
    await database.box.addAll(list);
  }
}
