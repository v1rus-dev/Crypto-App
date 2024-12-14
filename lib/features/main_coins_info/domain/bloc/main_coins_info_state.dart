part of 'main_coins_info_bloc.dart';

@immutable
sealed class MainCoinInfoState extends Equatable {}

final class MainCoinsInfoStateInitial extends MainCoinInfoState {
  @override
  List<Object?> get props => [];
}
