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