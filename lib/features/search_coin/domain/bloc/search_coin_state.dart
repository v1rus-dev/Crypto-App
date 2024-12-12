part of 'search_coin_bloc.dart';

final class SearchCoinState extends Equatable {
  final bool nothingFound;
  final List<String> hints;
  final List<SearchCoin> searchResults;

  const SearchCoinState(
      {required this.nothingFound,
      required this.hints,
      required this.searchResults});

  @override
  List<Object?> get props => [nothingFound, hints, searchResults];

  SearchCoinState copyWith(
      {bool? nothingFound,
      List<String>? hints,
      List<SearchCoin>? searchResults}) {
    return SearchCoinState(
        nothingFound: nothingFound ?? this.nothingFound,
        hints: hints ?? this.hints,
        searchResults: searchResults ?? this.searchResults);
  }
}
