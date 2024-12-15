part of 'main_coins_info_bloc.dart';

@immutable
sealed class MainCoinInfoState extends Equatable {}

final class MainCoinsInfoStateInitial extends MainCoinInfoState {
  @override
  List<Object?> get props => [];
}

final class ListOfCoins extends MainCoinInfoState {
  final List<CoinInfo> coins;

  ListOfCoins({required this.coins});

  @override
  List<Object> get props => [coins];
  ListOfCoins copyWith({List<CoinInfo>? coins}) {
    return ListOfCoins(coins: coins ?? this.coins);
  }
}
