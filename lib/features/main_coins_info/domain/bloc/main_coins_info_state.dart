part of 'main_coins_info_bloc.dart';

final class MainCoinsInfoState extends Equatable {
  final List<CoinInfo> coins;

  const MainCoinsInfoState({required this.coins});

  @override
  List<Object> get props => [coins];
  MainCoinsInfoState copyWith({List<CoinInfo>? coins}) {
    return MainCoinsInfoState(coins: coins ?? this.coins);
  }
}
