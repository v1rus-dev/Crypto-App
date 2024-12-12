import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency/data/api/dto/history/coin_history_dto.dart';
import 'package:crypto_currency/data/api/dto/one_coin_info_dto.dart';
import 'package:crypto_currency/data/database/dto/crypto_coin_local_dto.dart';
import 'package:crypto_currency/features/one_coin_details/domain/repository/one_coin_repository.dart';
import 'package:crypto_currency/utils/app_interable_extensions.dart';
import 'package:equatable/equatable.dart';

part 'one_coin_details_event.dart';
part 'one_coin_details_state.dart';

class OneCoinDetailsBloc
    extends Bloc<OneCoinDetailsEvent, OneCoinDetailsState> {
  final OneCoinRepository repository;

  Timer? timer;

  OneCoinDetailsBloc({required this.repository})
      : super(OneCoinDetailsState(isLoading: true)) {

    on<OneCoinDetailsLoadData>(_loadDetailsData);
    on<OneCoinDetailsLoadingData>(_loadingDataEventHandler);
    on<OneCoinDetailsUpdatePrices>(_updatePricesState);
    on<OneCoinDetailsUpdateHistory>(_updateHistory);
  }

  Future<void> _loadDetailsData(OneCoinDetailsLoadData event, Emitter<OneCoinDetailsState> emitter) async {

  }

  Future<void> _loadingDataEventHandler(OneCoinDetailsLoadingData event,
      Emitter<OneCoinDetailsState> emitter) async {
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

  Future<OneCoinInfoDTO?> getOneCoinInfo(String coinName) async {
    final result = await repository.load(coinName);
    return result;
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
