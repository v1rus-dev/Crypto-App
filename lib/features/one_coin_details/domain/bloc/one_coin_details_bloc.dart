import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency/data/api/entities/one_coin_info_entity.dart';
import 'package:crypto_currency/features/one_coin_details/domain/repository/one_coin_repository.dart';
import 'package:crypto_currency/repositories/crypto_compare/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';

part 'one_coin_details_event.dart';
part 'one_coin_details_state.dart';

class OneCoinDetailsBloc
    extends Bloc<OneCoinDetailsEvent, OneCoinDetailsState> {
  final OneCoinRepository repository;

  Timer? timer;
  late CryptoCoin coin;

  OneCoinDetailsBloc({required this.repository})
      : super(OneCoinDetailsState(isLoading: true)) {

    timer = Timer.periodic(const Duration(seconds: 10), (timer) async {
      OneCoinInfoEntity? result = await getOneCoinInfo(coin.name);

      add(OneCoinDetailsUpdatePrices(cointInfoEntity: result));
    });
    
    on<OneCoinDetailsLoadingData>(_loadingDataEventHandler);
    on<OneCoinDetailsUpdatePrices>(_updatePricesState);
  }

  Future<void> _loadingDataEventHandler(OneCoinDetailsLoadingData event,
      Emitter<OneCoinDetailsState> emitter) async {
    coin = event.coin;
    emitter.call(state.copyWith(coin: coin));
    final result = await repository.load(coin.name);

    if (result != null) {
      emitter.call(state.copyWith(
          isLoading: false,
          price: result.price,
          lowerPrice: result.lowDay,
          maxPrice: result.highDay,
          changePrcDay: result.changePrcDay));
    }
  }

  Future<void> _updatePricesState(OneCoinDetailsUpdatePrices event,
      Emitter<OneCoinDetailsState> emitter) async {
    final result = event.cointInfoEntity;

    if (result != null) {
      emitter.call(state.copyWith(
          isLoading: false,
          price: result.price,
          lowerPrice: result.lowDay,
          maxPrice: result.highDay));
    }
  }

  Future<OneCoinInfoEntity?> getOneCoinInfo(String coinName) async {
    final result = await repository.load(coinName);
    return result;
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
