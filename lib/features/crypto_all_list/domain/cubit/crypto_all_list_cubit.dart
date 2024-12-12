import 'package:bloc/bloc.dart';
import 'package:crypto_currency/data/database/dto/crypto_coin_local_dto.dart';
import 'package:crypto_currency/features/crypto_all_list/domain/repository/crypto_all_list_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'crypto_all_list_state.dart';

class CryptoAllListCubit extends Cubit<CryptoAllListState> {
  CryptoAllListCubit({required this.repository})
      : super(CryptoAllListState(isLoading: true, list: []));

  void init() async {
    final databaseIsEmpty = repository.databaseIsEmpty();
    if (databaseIsEmpty) {
      _loadValueFromNetwork();
    } else {
      getListFromDatabase();
    }
  }

  void getListFromDatabase() async {
    debugPrint('myTag getListFromDatabase 1');
    final list = await repository.getList();
    debugPrint('myTag getListFromDatabase 2: ${list.length}');
    emit(state.copyWith(isLoading: false, list: list));
  }

  Future<void> _loadValueFromNetwork() async {
    debugPrint('myTag loadValue from network 1');
    final result = await repository.downloadCryptoCoinsList();
    debugPrint('myTag loadValue from network 2: ${result.length}');
    await repository.updateAllCryptoCoinsListFromNetwork(result);
    debugPrint('myTag loadValue after insert to database');
    getListFromDatabase();
  }

  final CryptoAllListRepository repository;
}
