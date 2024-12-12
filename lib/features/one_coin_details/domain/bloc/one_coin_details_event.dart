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

final class OneCoinDetailsLoadingData extends OneCoinDetailsEvent {
  final Completer? completer;
  final CryptoCoinLocalDTO coin;

  const OneCoinDetailsLoadingData({this.completer, required this.coin});

  @override
  List<Object?> get props => [coin];
}

final class OneCoinDetailsUpdatePrices extends OneCoinDetailsEvent {
  final OneCoinInfoDTO? cointInfoEntity;

  const OneCoinDetailsUpdatePrices({required this.cointInfoEntity});

  @override
  List<Object?> get props => [cointInfoEntity];
}

final class OneCoinDetailsUpdateHistory extends OneCoinDetailsEvent {
  final List<CoinHistoryDTO> minuteHistory;
  final List<CoinHistoryDTO> hourHistory;
  final List<CoinHistoryDTO> dayHistory;

  const OneCoinDetailsUpdateHistory(
      {required this.minuteHistory,
      required this.hourHistory,
      required this.dayHistory});

  @override
  List<Object?> get props => [minuteHistory, hourHistory, dayHistory];
}
