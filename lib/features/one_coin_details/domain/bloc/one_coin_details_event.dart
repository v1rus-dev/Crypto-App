part of 'one_coin_details_bloc.dart';

sealed class OneCoinDetailsEvent extends Equatable {
  const OneCoinDetailsEvent();
}

final class OneCoinDetailsLoadingData extends OneCoinDetailsEvent {
  final Completer? completer;
  final CryptoCoin coin;

  const OneCoinDetailsLoadingData({this.completer, required this.coin});

  @override
  List<Object?> get props => [coin];
}

final class OneCoinDetailsUpdatePrices extends OneCoinDetailsEvent {
  final OneCoinInfoEntity? cointInfoEntity;

  const OneCoinDetailsUpdatePrices({required this.cointInfoEntity});

  @override
  List<Object?> get props => [cointInfoEntity];
}
