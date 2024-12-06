part of 'one_coin_details_bloc.dart';

sealed class CryptoCoinEvent extends Equatable {
  const CryptoCoinEvent();
}

final class CryptoCoinLoadingData extends CryptoCoinEvent {
  final Completer? completer;
  final CryptoCoin coin;

  const CryptoCoinLoadingData({this.completer, required this.coin});

  @override
  List<Object?> get props => [coin];
}
