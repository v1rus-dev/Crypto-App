import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency/features/crypto_all_list/domain/repository/crypto_all_list_repository.dart';
import 'package:crypto_currency/repositories/crypto_compare/models/crypto_coin.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_all_list_event.dart';
part 'crypto_all_list_state.dart';

class CryptoAllListBloc extends Bloc<CryptoAllListEvent, CryptoAllListState> {
  final CryptoAllListRepository repository;
  CryptoAllListBloc({required this.repository})
      : super(CryptoAllListState(isLoading: false, list: [])) {
    on<CryptoAllListInitialEvent>(_initialEventHandler);
    on<CryptoAllListUpdateSearchEvent>(_updateSearchHandler);
  }


  Future<void> _initialEventHandler(CryptoAllListInitialEvent event,
      Emitter<CryptoAllListState> stateEmitter) async {
    final databaseIsEmpty = repository.databaseIsEmpty();
    GetIt.I.get<Talker>().debug("Database is empty");

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
