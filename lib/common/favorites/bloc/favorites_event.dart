part of 'favorites_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

final class UpdateFavoritesList extends FavoritesEvent {
  @override
  List<Object> get props => [];
}

final class AddCoinToFavorite extends FavoritesEvent {
  const AddCoinToFavorite({required this.coin});
  final CryptoCoin coin;

  @override
  List<Object> get props => [coin];
}
