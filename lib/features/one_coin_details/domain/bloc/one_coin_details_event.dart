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

final class OneCoinDetailsUpdateHistory extends OneCoinDetailsEvent {
  final List<CoinHistoryEntity> minuteHistory;
  final List<CoinHistoryEntity> hourHistory;
  final List<CoinHistoryEntity> dayHistory;

  const OneCoinDetailsUpdateHistory(
      {required this.minuteHistory,
      required this.hourHistory,
      required this.dayHistory});

  @override
  List<Object?> get props => [minuteHistory, hourHistory, dayHistory];
}
