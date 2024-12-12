import 'package:crypto_currency/common/favorites/data/datasource/favorites_datasource.dart';
import 'package:crypto_currency/common/favorites/domain/repository/repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  @override
  Future<void> updateFavoriteState(String coinName) async {
    // TODO: implement updateFavoriteState
    throw UnimplementedError();
  }

  final FavoritesDatasource datasource;

  FavoritesRepositoryImpl({required this.datasource});

}