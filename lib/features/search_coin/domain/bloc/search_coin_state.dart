part of 'search_coin_bloc.dart';

final class SearchCoinState extends Equatable {
    SearchCoinState({
    required this.nothingFound,
  });

  final bool nothingFound;

  final SearchHintsController searchHintsController = SearchHintsController();
  final SearchResultController searchResultController = SearchResultController();

  @override
  List<Object> get props => [nothingFound];

  
  SearchCoinState copyWith({
    bool? nothingFound
  }) {
    return SearchCoinState(
          nothingFound: nothingFound ?? this.nothingFound,
    );
  }
}
