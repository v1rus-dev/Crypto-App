import 'package:crypto_currency/data/database/database.dart';
import 'package:crypto_currency/data/database/dto/crypto_coin_local_dto.dart';

class LocalMainCoinsInfoDatasource {
  Database<CryptoCoinLocalDTO> database = Database();

  Future<List<CryptoCoinLocalDTO>> getFavoriteCoins() async =>
      database.box.values.where((item) => item.isFavorite).toList();
}
