import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency/repositories/crypto_compare/abstract_coins_repository.dart';
import 'package:crypto_currency/repositories/crypto_compare/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'one_coin_details_event.dart';
part 'one_coin_details_state.dart';

class CryptoCoinBloc extends Bloc<CryptoCoinEvent, CryptoCoinState> {
  CryptoCoinBloc(this.repository) : super(CryptoCoinInitial()) {
    on<CryptoCoinEvent>((event, emit) async {
      switch (event) {
        case CryptoCoinLoadingData():
          {
            try {
              if (state is CryptoCoinInitial) {
                emit.call(CryptoCoinLoading());
              }

              final list = repository.getSimpleCoinPrice(event.name);

              debugPrint("Result: ${list.toString()}");
            } catch (e) {
              debugPrint(e.toString());
            } finally {
              event.completer?.complete();
            }
          }
      }
    });
  }

  final AbstractCryptoCompareRepository repository;
}
