import 'package:bloc/bloc.dart';
import 'package:crypto_currency/features/search_coin/domain/entities/search_coin.dart';
import 'package:crypto_currency/features/search_coin/domain/repository/search_coin_repository.dart';
import 'package:equatable/equatable.dart';

part 'search_coin_event.dart';
part 'search_coin_state.dart';

class SearchCoinBloc extends Bloc<SearchCoinEvent, SearchCoinState> {
  final SearchCoinRepository searchCoinRepository;

  SearchCoinBloc({required this.searchCoinRepository})
      : super(const SearchCoinState(
            nothingFound: false, hints: [], searchResults: [])) {
    on<SearchCoinUpdateSearchEvent>(_updateSearch);
  }

  Future<void> _updateSearch(SearchCoinUpdateSearchEvent event,
      Emitter<SearchCoinState> emitter) async {
    if (event.search.isEmpty) {
      emitter.call(
          state.copyWith(nothingFound: false, hints: [], searchResults: []));
      return;
    }

    final hints = await searchCoinRepository.getHints(event.search);
    final results = await searchCoinRepository.getResult(event.search);

    if (event.search.isNotEmpty && hints.isNotEmpty || results.isNotEmpty) {
      emitter.call(state.copyWith(
          nothingFound: false, hints: hints, searchResults: results));
      return;
    }

    if (event.search.isNotEmpty && hints.isEmpty && results.isEmpty) {
      emitter.call(state.copyWith(
          nothingFound: true, hints: hints, searchResults: results));
    }
  }
}
