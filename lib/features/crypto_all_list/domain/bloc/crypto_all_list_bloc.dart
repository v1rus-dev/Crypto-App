import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency/features/crypto_all_list/domain/repository/crypto_all_list_repository.dart';
import 'package:crypto_currency/repositories/crypto_compare/crypto_compare.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'crypto_all_list_event.dart';
part 'crypto_all_list_state.dart';

class CryptoAllListBloc extends Bloc<CryptoAllListEvent, CryptoAllListState> {
  final CryptoAllListRepository repository;
  CryptoAllListBloc({required this.repository})
      : super(CryptoAllListState(isLoading: false, list: [])) {
    on<CryptoAllListInitialEvent>(_initialEventHandler);
    on<CryptoAllListUpdateSearchEvent>(_updateSearchHandler);
  }

  // Future<void> test(
  //     CryptoAllListEvent event, Emitter<CryptoAllListState> emit) async {
  //   switch (event) {
  //     case LoadAllList():
  //       {
  //         try {
  //           if (state == CryptoAllListInitial) {
  //             emit.call(CryptoAllListLoading());
  //           }

  //           final list = await repository.getAllCoins();
  //         } catch (e) {
  //           debugPrint(e.toString());
  //           emit.call(CryptoAllListErrorLoading(e as Error));
  //         } finally {
  //           event.completer?.complete();
  //         }
  //       }
  //   }

  Future<void> _initialEventHandler(CryptoAllListInitialEvent event,
      Emitter<CryptoAllListState> stateEmitter) async {
    final databaseIsEmpty = repository.databaseIsEmpty();
    debugPrint("Database is empty: $databaseIsEmpty");

    if (!databaseIsEmpty) {
      await _getListForDatabase(stateEmitter);
      return;
    }

    stateEmitter.call(state.copyWith(isLoading: true));

    final list = await repository.downloadCryptoCoinsList();

    if (list.isNotEmpty) {
      await repository.updateAllCryptoCoinsList(list);
      stateEmitter.call(state.copyWith(isLoading: false, list: list));
    }
  }

  _getListForDatabase(Emitter<CryptoAllListState> stateEmitter) async {
    final list = await repository.getList();
    stateEmitter.call(state.copyWith(list: list));
  }

  Future<void> _updateSearchHandler(CryptoAllListUpdateSearchEvent event,
      Emitter<CryptoAllListState> stateEmitter) async {
    debugPrint("New search: ${event.search}");
    if (event.search.trim().isEmpty) {
      await _getListForDatabase(stateEmitter);
      return;
    } else {
      await _getListForDatabaseBySearch(stateEmitter, event.search);
      return;
    }
  }

  _getListForDatabaseBySearch(
      Emitter<CryptoAllListState> stateEmitter, String search) async {
    final list = await repository.search(search);
    stateEmitter.call(state.copyWith(list: list));
  }
}
