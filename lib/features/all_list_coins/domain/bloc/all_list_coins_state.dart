part of 'all_list_coins_bloc.dart';

sealed class AllListCoinsState extends Equatable {
  const AllListCoinsState();
}

final class AllListCoinsInitial extends AllListCoinsState {
  @override
  List<Object?> get props => [];
}

final class AllListCoinsLoading extends AllListCoinsState {
  @override
  List<Object?> get props => [];
}

final class AllListCoinsLoaded extends AllListCoinsState {
  final List<CoinEntity> listOfCoins;

  const AllListCoinsLoaded({required this.listOfCoins});

  @override
  List<Object?> get props => [listOfCoins];
}
