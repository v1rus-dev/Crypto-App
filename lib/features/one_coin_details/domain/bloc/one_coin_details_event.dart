part of 'one_coin_details_bloc.dart';

sealed class OneCoinDetailsEvent extends Equatable {
  const OneCoinDetailsEvent();
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
