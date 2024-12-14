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

final class UpdateCoinFavorite extends FavoritesEvent {
  final String coinName;

  const UpdateCoinFavorite({required this.coinName});

  @override
  List<Object> get props => [coinName];
}
