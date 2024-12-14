import 'package:crypto_currency/common/favorites/data/datasource/favorites_datasource.dart';
import 'package:crypto_currency/common/favorites/domain/repository/repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesDatasource localDatasource;

  FavoritesRepositoryImpl({required this.localDatasource});

  @override
  Future<bool> updateFavoriteState(String coinName) async =>
      localDatasource.updateFavorite(coinName);
}
