import 'package:crypto_currency/common/utils/local_datasource.dart';
import 'package:crypto_currency/data/database/dto/crypto_coin_local_dto.dart';

class FavoritesDatasource extends LocalDatasource<CryptoCoinLocalDTO> {
  FavoritesDatasource({required super.dataBox});

  Future<void> addCryptoCoinToFavorite(CryptoCoinLocalDTO coin) async {
    coin.isFavorite = true;
    coin.save();
  }

  Future<void> removeCryptoCoinFromFavorite(CryptoCoinLocalDTO coin) async {
    coin.isFavorite = false;
    coin.save();
  }
}
