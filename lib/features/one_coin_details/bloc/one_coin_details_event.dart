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

final class OneCoinDetailsStartPeriodicTimer extends OneCoinDetailsEvent {
  @override
  List<Object?> get props => [];
}

final class OneCoinDetailsDispose extends OneCoinDetailsEvent {
  @override
  List<Object?> get props => [];
}
