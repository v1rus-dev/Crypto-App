import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency/repositories/crypto_compare/abstract_coins_repository.dart';
import 'package:crypto_currency/repositories/crypto_compare/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

part 'one_coin_details_event.dart';
part 'one_coin_details_state.dart';

class OneCoinDetailsBloc extends Bloc<CryptoCoinEvent, OneCoinDetailsState> {
  OneCoinDetailsBloc(this.repository) : super(OneCoinDetailsInitial()) {
    on<CryptoCoinEvent>((event, emit) async {
      switch (event) {
        case CryptoCoinLoadingData():
          {
            try {
              if (state is OneCoinDetailsInitial) {
                emit.call(OneCoinDetailsLoading());
              }

              final info = await repository.getCoinInfo(event.coin.name);
              if (info != null) {
                emit.call(
                    OneCoinDetailsSuccess(coin: event.coin, coinInfo: info));
              } else {}
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
