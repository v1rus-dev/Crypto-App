part of 'one_coin_details_bloc.dart';

final class OneCoinDetailsState extends Equatable {
  final String coinName;
  final String fullCoinName;
  final bool isLoading;
  final CoinBaseInfo coinBaseInfo;

  const OneCoinDetailsState(
      {required this.coinName,
      required this.fullCoinName,
      required this.isLoading,
      required this.coinBaseInfo});

  @override
  List<Object?> get props => [coinName, fullCoinName, isLoading];
  OneCoinDetailsState copyWith(
      {String? coinName,
      String? fullCoinName,
      bool? isLoading,
      CoinBaseInfo? coinBaseInfo}) {
    return OneCoinDetailsState(
        coinName: coinName ?? this.coinName,
        fullCoinName: fullCoinName ?? this.fullCoinName,
        isLoading: isLoading ?? this.isLoading,
        coinBaseInfo: coinBaseInfo ?? this.coinBaseInfo);
  }
}
