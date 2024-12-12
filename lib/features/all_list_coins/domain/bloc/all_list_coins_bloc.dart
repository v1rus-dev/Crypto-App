import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency/features/all_list_coins/domain/entities/entities.dart';
import 'package:crypto_currency/features/all_list_coins/domain/repository/repository.dart';
import 'package:equatable/equatable.dart';

part 'all_list_coins_event.dart';
part 'all_list_coins_state.dart';

class AllListCoinsBloc extends Bloc<AllListCoinsEvent, AllListCoinsState> {
  AllListCoinsBloc({required this.repository}) : super(AllListCoinsInitial()) {
    on<LoadCoins>(_loadCoins);
    on<UpdateCoinsManualy>(_updateCoinsManualy);
  }

  Future<void> _loadCoins(LoadCoins event, Emitter<AllListCoinsState> emitter) async {
    final databaseIsEmpty = repository.databaseIsEmpty();

    if (databaseIsEmpty) {
      await repository.loadCoins();
      final list = await _getCoinsList();
      emitter.call(AllListCoinsLoaded(listOfCoins: list));
    } else {
      final list = await _getCoinsList();
      emitter.call(AllListCoinsLoaded(listOfCoins: list));
    }
  }

  Future<void> _updateCoinsManualy(UpdateCoinsManualy event, Emitter<AllListCoinsState> emitter) async {
    await repository.loadCoins();
    final list = await _getCoinsList();
    emitter.call(AllListCoinsLoaded(listOfCoins: list));
    event.completer?.complete();
  }

  Future<List<CoinEntity>> _getCoinsList() async => repository.getAllList();

  final AllListRepository repository;
}
