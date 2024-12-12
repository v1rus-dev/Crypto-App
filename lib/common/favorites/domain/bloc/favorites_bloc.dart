import 'package:bloc/bloc.dart';
import 'package:crypto_currency/common/favorites/domain/repository/favorites_repository.dart';
import 'package:crypto_currency/data/database/dto/crypto_coin_local_dto.dart';
import 'package:equatable/equatable.dart';
part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepository repository;
  FavoritesBloc({required this.repository}) : super(FavoritesInitial()) {
    on<UpdateFavoritesList>(_updateFavoritesListHandler);
    on<AddCoinToFavorite>(_updateCoinFavorites);
  }

  Future<void> _updateFavoritesListHandler(
      UpdateFavoritesList event, Emitter<FavoritesState> emitter) async {}

  Future<void> _updateCoinFavorites(
      AddCoinToFavorite event, Emitter<FavoritesState> emitter) async {
    repository.updateFavoriteState(event.coin.coinName);
  }
}
