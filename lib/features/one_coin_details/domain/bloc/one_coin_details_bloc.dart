import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency/data/api/entities/history/coin_history_entity.dart';
import 'package:crypto_currency/data/api/entities/one_coin_info_entity.dart';
import 'package:crypto_currency/features/one_coin_details/domain/repository/one_coin_repository.dart';
import 'package:crypto_currency/repositories/crypto_compare/models/models.dart';
import 'package:crypto_currency/utils/app_interable_extensions.dart';
import 'package:equatable/equatable.dart';
import 'package:async/async.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
    on<OneCoinDetailsUpdateHistory>(_updateHistory);
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

    final historyMinute = await repository.loadHistoryForMinute(coin.name);
    final historyHour = await repository.loadHistoryForHour(coin.name);
    final historyDay = await repository.loadHistoryForDay(coin.name);

    debugPrint('Minute: ${historyMinute.toString()}');
    debugPrint('Hour: ${historyHour.toString()}');
    debugPrint('Day: ${historyDay.toString()}');

    add(OneCoinDetailsUpdateHistory(
        minuteHistory: historyMinute ?? [],
        hourHistory: historyHour ?? [],
        dayHistory: historyDay ?? []));
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

  Future<void> _updateHistory(OneCoinDetailsUpdateHistory event,
      Emitter<OneCoinDetailsState> emitter) async {
    emitter.call(state.copyWith(
        history: History(
            minuteHistory: event.minuteHistory.mapIndexed((index, item) {
              return Spot(x: index.toDouble(), y: item.high);
            }).toList(),
            hourHistory: event.hourHistory.mapIndexed((index, item) {
              return Spot(x: index.toDouble(), y: item.high);
            }).toList(),
            dayHistory: event.dayHistory.mapIndexed((index, item) {
              return Spot(x: index.toDouble(), y: item.high);
            }).toList())));
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
