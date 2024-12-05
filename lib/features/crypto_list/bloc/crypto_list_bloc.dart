import 'package:bloc/bloc.dart';
import 'package:crypto_currency/repositories/crypto_compare/crypto_compare.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.repository) : super(CryptoListInitial()) {
    on<CryptoListEvent>((event, emit) async {
      switch (event) {
        case LoadCryptoList():
          {
            emit(CryptoListLoading());
            try {
              final cryptoCoinsList = await repository.getCoinsList();
              emit(CryptoListSuccess(coinsList: cryptoCoinsList));
            } catch (e) {
              debugPrint(e.toString());
              emit(CryptoListLoadingFailure(exception: e));
            }
          }
      }
    });
  }

  final AbstractCryptoCompareRepository repository;
}
