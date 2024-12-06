import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency/repositories/crypto_compare/abstract_coins_repository.dart';
import 'package:crypto_currency/repositories/crypto_compare/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';

part 'one_coin_details_event.dart';
part 'one_coin_details_state.dart';

class OneCoinDetailsBloc extends Bloc<OneCoinDetailsEvent, OneCoinDetailsState> {
  final AbstractCryptoCompareRepository repository;

  RestartableTimer? timer;
  CryptoCoin? coin;

  OneCoinDetailsBloc(this.repository) : super(OneCoinDetailsInitial()) {
    on<OneCoinDetailsLoadingData>((event, emit) async {
      try {
        coin = event.coin;
        if (state is OneCoinDetailsInitial) {
          emit.call(OneCoinDetailsLoading());
        }

        final info = await repository.getCoinInfo(event.coin.name);
        if (info != null) {
          emit.call(OneCoinDetailsSuccess(coin: event.coin, coinInfo: info));
        } else {}
      } catch (e) {
        debugPrint(e.toString());
      } finally {
        event.completer?.complete();
      }
    });

    on<OneCoinDetailsStartPeriodicTimer>((event, emit) {
      timer ??= createTimer();

      getCoinInfo(coin);

      final timerIsActive = timer?.isActive ?? false;

      if (!timerIsActive) {
        timer?.reset();
      }
    });

    on<OneCoinDetailsDispose>((event, emit) {
      timer?.cancel();
    });
  }

  RestartableTimer createTimer() {
    return RestartableTimer(const Duration(seconds: 10), () {
      getCoinInfo(coin);
    });
  }

  void getCoinInfo(CryptoCoin? coin) async {
    if (coin == null) return;

    final result = await repository.getCoinFullData(coin.name);
    debugPrint("Result: $result");
  }
}
