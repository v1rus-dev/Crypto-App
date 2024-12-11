import 'package:crypto_currency/common/favorites/datasource/favorites_datasource.dart';
import 'package:crypto_currency/data/database/entities/crypto_coin.dart';

class FavoritesRepository {
  final FavoritesDatasource localDatasource;
  const FavoritesRepository({required this.localDatasource});

  Future<void> updateFavoriteState(CryptoCoin coin) async {
    coin.isFavorite
        ? localDatasource.addCryptoCoinToFavorite(coin)
        : localDatasource.removeCryptoCoinFromFavorite(coin);
  }
}
