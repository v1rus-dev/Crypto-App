import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_currency/features/one_coin_details/domain/entities/coin_base_info.dart';
import 'package:crypto_currency/features/one_coin_details/domain/entities/coin_history_info.dart';
import 'package:crypto_currency/features/one_coin_details/domain/repository/one_coin_repository.dart';
import 'package:equatable/equatable.dart';

part 'one_coin_details_event.dart';
part 'one_coin_details_state.dart';

class OneCoinDetailsBloc
    extends Bloc<OneCoinDetailsEvent, OneCoinDetailsState> {
  final OneCoinRepository repository;

  OneCoinDetailsBloc({required this.repository})
      : super(
          OneCoinDetailsState(
            coinName: '',
            fullCoinName: '',
            isLoading: true,
            coinBaseInfo: CoinBaseInfo.empty,
            isFavorite: false,
            isLoadingHistory: true,
            historyInfoMinute: List.empty(),
            historyInfoHour: List.empty(),
            historyInfoDay: List.empty(),
          ),
        ) {
    on<OneCoinDetailsLoadData>(_loadDetailsData);
    on<OneCoinDetailsUpdateHistory>(_updateHistory);
    on<UpdateFavoriteStateEvent>(_updateFavoriteState);
  }

  Future<void> _loadDetailsData(OneCoinDetailsLoadData event,
      Emitter<OneCoinDetailsState> emitter) async {
    final localInfo = await repository.getLocalInfo(event.coinName);

    emitter.call(state.copyWith(
      coinName: localInfo.name,
      fullCoinName: localInfo.coinName,
      isFavorite: localInfo.isFavorite,
    ));

    final coinInfo = await repository.load(event.coinName);

    emitter.call(state.copyWith(coinBaseInfo: coinInfo, isLoading: false));
  }

  Future<void> _updateHistory(OneCoinDetailsUpdateHistory event,
      Emitter<OneCoinDetailsState> emitter) async {
    final coinName = state.coinName;

    if (coinName.isEmpty) {
      return;
    }

    final historyMinute = await repository.loadHistoryForMinute(coinName);
    final historyHour = await repository.loadHistoryForHour(coinName);
    final historyDay = await repository.loadHistoryForDay(coinName);

    emitter.call(state.copyWith(
      isLoadingHistory: false,
      historyInfoMinute: historyMinute.toList(),
      historyInfoHour: historyHour.toList(),
      historyInfoDay: historyDay.toList(),
    ));
  }

  Future<void> _updateFavoriteState(UpdateFavoriteStateEvent event,
      Emitter<OneCoinDetailsState> emitter) async {
    if (state.coinName == event.coinName &&
        state.isFavorite != event.isFavorite) {
      emitter.call(state.copyWith(isFavorite: event.isFavorite));
    }
  }
}
