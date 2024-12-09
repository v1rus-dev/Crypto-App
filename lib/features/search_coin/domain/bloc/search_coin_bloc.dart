import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'search_coin_event.dart';
part 'search_coin_state.dart';

class SearchCoinBloc extends Bloc<SearchCoinEvent, SearchCoinState> {
  SearchCoinBloc() : super(SearchCoinInitial()) {
    GetIt.I.get<Talker>().debug('Search coin bloc init');
    on<SearchCoinEvent>((event, emit) {});
  }
}
