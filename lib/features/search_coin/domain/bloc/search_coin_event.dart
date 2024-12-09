part of 'search_coin_bloc.dart';

sealed class SearchCoinEvent extends Equatable {}

final class SearchCoinUpdateSearchEvent extends SearchCoinEvent {
  final String search;

  SearchCoinUpdateSearchEvent({required this.search});

  @override
  List<Object?> get props => [search];
}