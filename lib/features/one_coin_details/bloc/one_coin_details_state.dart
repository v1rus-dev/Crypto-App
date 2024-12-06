part of 'one_coin_details_bloc.dart';

sealed class OneCoinDetailsState extends Equatable {
  const OneCoinDetailsState();
}

final class OneCoinDetailsInitial extends OneCoinDetailsState {
  @override
  List<Object?> get props => [];
}

final class OneCoinDetailsLoading extends OneCoinDetailsState {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
final class OneCoinDetailsFailure extends OneCoinDetailsState {
  Object? exception;

  @override
  List<Object?> get props => [exception];
}

final class OneCoinDetailsSuccess extends OneCoinDetailsState {
  const OneCoinDetailsSuccess({required this.coin, required this.coinInfo});
  final CryptoCoin coin;
  final CoinInfo coinInfo;

  @override
  List<Object?> get props => [coin, coinInfo];
}
