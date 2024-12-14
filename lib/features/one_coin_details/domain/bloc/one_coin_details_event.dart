part of 'one_coin_details_bloc.dart';

sealed class OneCoinDetailsEvent extends Equatable {
  const OneCoinDetailsEvent();
}

final class OneCoinDetailsLoadData extends OneCoinDetailsEvent {
  final String coinName;

  const OneCoinDetailsLoadData({required this.coinName});

  @override
  List<Object?> get props => [coinName];
}

final class UpdateFavoriteStateEvent extends OneCoinDetailsEvent {
  final String coinName;
  final bool isFavorite;

  const UpdateFavoriteStateEvent({required this.coinName, required this.isFavorite});

  @override
  List<Object> get props => [coinName, isFavorite];
}

final class OneCoinDetailsUpdateHistory extends OneCoinDetailsEvent {
  @override
  List<Object?> get props => [];
}
