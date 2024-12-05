import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency/repositories/crypto_compare/crypto_compare.dart';
import 'package:equatable/equatable.dart';
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
            try {
              if (state is CryptoListInitial) {
                emit(CryptoListLoading());
              }
              final cryptoCoinsList =
                  await repository.getSelectedCoinsList(['BTC', 'ETH', 'SHIB']);
              emit(CryptoListSuccess(coinsList: cryptoCoinsList));
            } catch (e) {
              debugPrint(e.toString());
              emit(CryptoListLoadingFailure(exception: e));
            } finally {
              event.complerer?.complete();
            }
          }
      }
    });
  }

  final AbstractCryptoCompareRepository repository;
}
