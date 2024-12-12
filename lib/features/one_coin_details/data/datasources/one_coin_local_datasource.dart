import 'package:crypto_currency/data/database/database.dart';
import 'package:crypto_currency/data/database/dto/crypto_coin_local_dto.dart';

class OneCoinLocalDatasource {
  Database<CryptoCoinLocalDTO> database = Database();

  Future<CryptoCoinLocalDTO> getCoinByName(String coinName) async =>
      database.box.values.firstWhere((item) => item.name == coinName);
}
