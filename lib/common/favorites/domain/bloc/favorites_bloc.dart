import 'package:bloc/bloc.dart';
import 'package:crypto_currency/common/favorites/domain/repository/favorites_repository.dart';
import 'package:equatable/equatable.dart';
part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesBlocState> {
  final FavoritesRepository repository;
  FavoritesBloc({required this.repository}) : super(FavoritesInitial()) {
    on<UpdateFavoritesList>(_updateFavoritesListHandler);
    on<UpdateCoinFavorite>(_updateCoinFavorite);
  }

  Future<void> _updateFavoritesListHandler(
    UpdateFavoritesList event,
    Emitter<FavoritesBlocState> emitter,
  ) async {}

  Future<void> _updateCoinFavorite(
    UpdateCoinFavorite event,
    Emitter<FavoritesBlocState> emitter,
  ) async {
    final result = await repository.updateFavoriteState(event.coinName);
    emitter.call(FavoritesUpdated(coinName: event.coinName, newValue: result));
  }
}
