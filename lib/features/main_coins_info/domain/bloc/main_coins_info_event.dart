part of 'main_coins_info_bloc.dart';

@immutable
sealed class MainCoinsInfoEvent extends Equatable {}

final class GetFavoriteCoinsEvent extends MainCoinsInfoEvent {
  @override
  List<Object?> get props => [];
}
