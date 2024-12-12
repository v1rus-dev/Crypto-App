part of 'all_list_coins_bloc.dart';

sealed class AllListCoinsEvent extends Equatable {
  const AllListCoinsEvent();
}

final class LoadCoins extends AllListCoinsEvent {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
final class UpdateCoinsManualy extends AllListCoinsEvent {
  Completer? completer;

  UpdateCoinsManualy(this.completer);

  @override
  List<Object?> get props => [completer];
}
