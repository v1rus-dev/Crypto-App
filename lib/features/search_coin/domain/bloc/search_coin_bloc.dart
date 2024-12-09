import 'package:bloc/bloc.dart';
import 'package:crypto_currency/features/search_coin/domain/controllers/search_hints_controller.dart';
import 'package:crypto_currency/features/search_coin/domain/controllers/search_result_controller.dart';
import 'package:crypto_currency/features/search_coin/domain/repository/search_coin_repository.dart';
import 'package:equatable/equatable.dart';

part 'search_coin_event.dart';
part 'search_coin_state.dart';

class SearchCoinBloc extends Bloc<SearchCoinEvent, SearchCoinState> {
  final SearchCoinRepository searchCoinRepository;

  SearchCoinBloc({required this.searchCoinRepository})
      : super(SearchCoinState(nothingFound: false)) {
    on<SearchCoinUpdateSearchEvent>(_updateSearch);
  }

  int callCount = 0;

  Future<void> _updateSearch(SearchCoinUpdateSearchEvent event,
      Emitter<SearchCoinState> emitter) async {
    callCount++;
    if (event.search.isNotEmpty) {
      final _result = searchCoinRepository.getHints(event.search);
      final _searchResult = searchCoinRepository.getResult(event.search);

      final result = await _result;
      final searchResult = await _searchResult;
      state.searchHintsController.add(result);
      state.searchResultController.add(searchResult);

      if (event.search.isNotEmpty) {
        emitter.call(state.copyWith(nothingFound: true));
      } else {
        emitter.call(state.copyWith(nothingFound: false));
      }
    } else {
      state.searchHintsController.add([]);
      state.searchResultController.add([]);
    }
  }

  @override
  Future<void> close() {
    state.searchHintsController.close();
    state.searchResultController.close();
    return super.close();
  }
}
