import 'package:crypto_currency/data/database/database.dart';
import 'package:crypto_currency/data/database/dto/crypto_coin_local_dto.dart';

class FavoritesDatasource {

  Database<CryptoCoinLocalDTO> database = Database();

  Future<bool> updateFavorite(String coinName) async {
    final coin = database.box.values.firstWhere((item) => item.name == coinName);
    coin.isFavorite = !coin.isFavorite;
    coin.save();
    return coin.isFavorite;
  }
}
