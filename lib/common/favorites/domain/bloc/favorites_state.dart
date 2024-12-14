part of 'favorites_bloc.dart';

sealed class FavoritesBlocState extends Equatable {
  const FavoritesBlocState();

  @override
  List<Object> get props => [];
}

final class FavoritesInitial extends FavoritesBlocState {}

final class FavoritesUpdated extends FavoritesBlocState {
  final String coinName;
  final bool newValue;

  const FavoritesUpdated({required this.coinName, required this.newValue});

  @override
  List<Object> get props => [coinName, newValue];
}
